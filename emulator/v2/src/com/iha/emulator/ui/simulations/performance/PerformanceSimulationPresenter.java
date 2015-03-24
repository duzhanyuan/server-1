package com.iha.emulator.ui.simulations.performance;

import com.iha.emulator.communication.protocol.Protocol;
import com.iha.emulator.communication.protocol.ProtocolFactory;
import com.iha.emulator.control.task.SimulationTask;
import com.iha.emulator.control.task.StopCondition;
import com.iha.emulator.control.task.ValueParameters;
import com.iha.emulator.models.Server;
import com.iha.emulator.models.value.Value;
import com.iha.emulator.models.value.ValueFactory;
import com.iha.emulator.ui.Presenter;
import com.iha.emulator.ui.dialogs.task.AddNewTaskDialogPresenter;
import com.iha.emulator.ui.dialogs.task.DeleteTasksDialogPresenter;
import com.iha.emulator.ui.panels.chart.ResponseChart;
import com.iha.emulator.ui.panels.server.details.ServerDetailsPresenter;
import com.iha.emulator.ui.panels.task.cell.*;
import com.iha.emulator.ui.panels.task.details.TaskDetailsPresenter;
import com.iha.emulator.utilities.Utilities;
import com.iha.emulator.utilities.logging.AdapterLogger;
import com.iha.emulator.utilities.logging.TextAreaAppender;
import com.iha.emulator.utilities.watchers.MemoryChecker;
import com.iha.emulator.utilities.watchers.QueueWatcher;
import javafx.application.HostServices;
import javafx.application.Platform;
import javafx.beans.binding.BooleanBinding;
import javafx.beans.property.*;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.concurrent.Task;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import jfxtras.scene.control.LocalDateTimeTextField;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Properties;

/**
 * Created by Filip Sutovsky on 14/11/14.
 */
public class PerformanceSimulationPresenter implements Presenter{

    private static final Logger logger = LogManager.getLogger(PerformanceSimulationPresenter.class);
    private static final boolean DEBUG_AUTO_CREATE = false;
    private static final String SAVES_DEFAULT_DIR = "saved/tasks";
    private static final String FXML_PATH = "PerformanceSimulation.fxml";
    private static final String CSS_PATH = "/com/iha/emulator/resources/css/theme-light.css";

    private Stage window;
    private HostServices hostServices;

    private MemoryChecker memoryChecker = MemoryChecker.getInstance();
    private Properties properties;
    private QueueWatcher queueWatcher;

    //region PRESENTERS
    private ServerDetailsPresenter serverDetailsPresenter;
    private TaskDetailsPresenter taskDetailsPresenter;
    //endregion
    private ResponseChart responseChart;
    //region TASKS
    private ObjectProperty<SimulationTask> currentTask;
    private ObservableList<SimulationTask> tasks = FXCollections.observableArrayList();
    private ListProperty<SimulationTask> tasksList = new SimpleListProperty<>(tasks);
    //endregion

    public interface Display {
        public void setPresenter(PerformanceSimulationPresenter presenter);
        public Node getView();
        public TabPane getLogTabPane();
        public Tab getErrorTab();
        public void setStatusLine(String status);
        public void setStatusIndicator(boolean visible);
        public ProgressBar getMemCheckProgressBar();
        public Label getMemCheckStatusLabel();
        public TextArea getApplicationLogTextArea();
        public void addServerDetailsView(Node serverDetailsView);
        public void addTaskDetailsView(Node taskDetailsView);
        public Button getSaveAllBtn();
        public MenuItem getOpenItem();
        public Button getOpenTBtn();
        public FlowPane getTaskDetailsContainer();
        public Node getAdapterLogContainer();
        public Node getToBeSentLogContainer();
        public Node getErrorLogContainer();
        public ToggleGroup getLogMessageTypeRadBtnGroup();
        public RadioButton getFullLogMessageRadBtn();
        public RadioButton getPartialLogMessageRadBtn();
        public RadioButton getShortLogMessageRadBtn();
        public Button getShowFullLogBtn();
        public MenuItem getNewTaskItem();
        public MenuItem getStartTaskItem();
        public MenuItem getPauseTaskItem();
        public MenuItem getStopTaskItem();
        public MenuItem getResumeSensorsItem();
        public MenuItem getPauseSensorsItem();
        public Button getStartTaskTBtn();
        public Button getPauseTaskTBtn();
        public Button getStopTaskTBtn();
        public Button getPauseSensorsTBtn();
        public Button getResumeSensorsTBtn();
        public Button getDeleteTaskTBtn();
        public Button getNewTaskTBtn();
        public TableColumn getIdColumn();
        public TableColumn getServerColumn();
        public TableColumn getStateColumn();
        public TableColumn getEnabledColumn();
        public TableColumn getStopConditionColumn();
        public HBox getQueueProcessContainer();
        public Button getQueueProcessOnBtn();
        public Button getQueueProcessOffBtn();
        public LocalDateTimeTextField getStartDateTimeTextField();
        public void setStartDateTimeTextField(LocalDateTimeTextField startDateTimeTextField);
        public RadioButton getPickTimeStartRadBtn();
        public RadioButton getImmediatelyStartRadBtn();
        public TableView getTasksTable();
        public StackPane getResponseChartContainer();
    }
    //region variables
    private Display view;
    //endregion

    //region constructor
    public PerformanceSimulationPresenter(Stage window) {
        this.window = window;
        this.currentTask = new SimpleObjectProperty<>(null);
    }
    //endregion

    //region public methods
    public void startTask(){
        if(getCurrentTask() == null) return;
        switch (getCurrentTask().getSimulationState()){
            case ERROR:
            case FINISHED:
                setStatus("Restarting task " + getCurrentTask().getId(),true);
                logger.debug(getCurrentTask().toString() + " -> RESTARTING");
                getCurrentTask().restart();
                setStatus(getCurrentTask().toString() + " restarted",false);
                break;
            default:
                setStatus("Starting task " + getCurrentTask().getId(),true);
                logger.debug(getCurrentTask().toString() + " -> STARTING");
                getCurrentTask().start();
                setStatus(getCurrentTask().toString() + " started",false);
                break;
        }
    }

    public void stopTask(){
        if(getCurrentTask() == null) return;
        logger.debug(getCurrentTask().toString() + " -> STOPPING");
        setStatus("Stopping task " + getCurrentTask().getId(),true);
        getCurrentTask().stop();
        setStatus(getCurrentTask().toString() + " stopped",false);
    }

    public void pauseTask(){
        if(getCurrentTask() == null) return;
        logger.debug(getCurrentTask().toString() + " -> PAUSING");
        getCurrentTask().pause();
        setStatus(getCurrentTask().toString() + " paused",false);
    }

    public void resumeSensors(){
        if(getCurrentTask() == null) return;
        logger.debug(getCurrentTask().toString() + " -> RESUMING SENSORS");
        getCurrentTask().resumeSensors();
    }

    public void pauseSensors(){
        logger.debug(getCurrentTask().toString() + " -> PAUSING SENSORS");
        getCurrentTask().pauseSensors();
    }

    public void addTask(){
        logger.trace("Creating new task");
        if(!DEBUG_AUTO_CREATE){
            Task<Object> worker = new Task<Object>() {
                @Override
                protected Object call() throws Exception {
                    LongProperty progress = new SimpleLongProperty(0);
                    progress.addListener(new ChangeListener<Number>() {
                        @Override
                        public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {
                            if((Long)newValue > 0 && (Long)newValue < 100)
                                updateProgress((long)newValue,100);
                        }
                    });
                    ObservableList<Server> tmp;
                    try{
                        tmp = Utilities.buildServersFromProperties(properties,progress);
                        final ObservableList<Server> finalTmp = tmp;
                        Platform.runLater(() -> showAddTaskDialog(finalTmp));
                    }catch (IllegalArgumentException e){
                        Platform.runLater(() -> showAddTaskDialog(null));
                        Platform.runLater(() -> Utilities.showException(logger, "Cannot load settings from properties file", e, false, null));
                    }
                    return null;
                }
            };
            Utilities.showLoadingDialog(worker, "Loading...");
        }else {
            Task<Object> worker = new Task<Object>() {
                @Override
                protected Object call() throws Exception {
                    LongProperty progress = new SimpleLongProperty(0);
                    progress.addListener(new ChangeListener<Number>() {
                        @Override
                        public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {
                            if((Long)newValue > 0 && (Long)newValue < 100)
                                updateProgress((long)newValue,100);
                        }
                    });
                    SimulationTask task = new SimulationTask();
                    //set id
                    if(getTasks().size() == 0){
                        task.setId(0);
                    }else{
                        task.setId(getTasks().get(getTasks().size()-1).getId()+1);
                    }
                    //create server model for task
                    logger.trace("Creating new task -> Creating server");
                    task.createServer(false,"production","10.1.0.1",9092,"home4prod");
                    //create task parameters
                    logger.trace("Creating new task -> Creating parameters");
                    task.createTaskParameters(
                            1, //adapters count
                            Protocol.Version.ZERO_POINT_ONE, //protocol version
                            1000, //starting adapter id
                            3, // sensors count minimum
                            3, //sensors count maximum
                            5, //refresh time minimum
                            5, //refresh time maximum
                            null // default save dir
                    );
                    //register tracking responses per second
                    task.getResponseTracker().registerSecondCounter(task.getTaskParameters().getStopWatch().timeProperty());
                    //update progress
                    progress.set(10);
                    //create value information
                    ObservableList<Value> enabledValues = FXCollections.observableArrayList();
                    enabledValues = generateEnabledValues(enabledValues);
                    ValueParameters valueParameters = new ValueParameters();
                    valueParameters.setEnabledValues(enabledValues);
                    task.setValueParameters(valueParameters);
                    //create log
                    logger.trace("Creating new task -> Creating logs");
                    task.createLog(view.getLogTabPane());
                    task.getLog().createLogs();
                    //set message tracking (waiting and sent counter)
                    logger.trace("Creating new task -> Creating logs -> Enabling response tracking");
                    task.getLog().getMessageTracker().setEnabled(true);
                    //DON'T show to be sent messages
                    logger.trace("Creating new task -> Creating logs -> Disabling To Be Sent log");
                    task.getLog().setShowToBeSent(false);
                    //set log to buffer
                    logger.trace("Creating new task -> Setting logs to buffer");
                    try {
                        task.getLog().setBuffered(true,"task_"+task.getId()+"_",task.getTaskParameters().getSaveDir());
                        task.getLog().writeTaskLogHeaderToBuffer(task);
                        logger.trace("");
                    } catch (IOException e) {
                        Utilities.showException(logger, "Cannot create buffer file for new task's log.", e, true, event -> quit());
                    }
                    //register stop conditions
                    logger.trace("Creating new task -> Creating stop conditions");
                    StopCondition sc = task.createStopCondition();
                    sc.registerWaitingMessageWatcher(4000);
                    //add to other tasks
                    logger.trace("Creating new task -> Adding task to list");
                    getTasks().add(task);
                    //initialize adapters
                    progress.set(20);
                    logger.trace("Creating new task -> Creating adapters");
                    task.setSimulationState(SimulationTask.State.READY);
                    //add QueueWatcher to task
                    task.setQueueWatcher(getQueueWatcher());
                    progress.set(100);
                    return null;
                }
            };
            Utilities.showLoadingDialog(worker,"Creating task...");
        }
    }

    public void deleteTask(){
        if(getCurrentTask() != null && getCurrentTask().getRunning()){
            logger.trace("Showing delete conformation dialog");
            Alert dlg = new Alert(Alert.AlertType.WARNING,"");
            dlg.initModality(Modality.WINDOW_MODAL);
            dlg.initOwner(window);
            dlg.setTitle("Delete tasks");
            dlg.getDialogPane().setContentText("Current task is running. Please stop every task, before trying to delete.");
            dlg.show();
        }else{
            switchCurrentTask(null);
            logger.trace("Showing delete dialog");
            DeleteTasksDialogPresenter deleteTasksDialogPresenter;
            try{
                Stage stage = new Stage();
                deleteTasksDialogPresenter = new DeleteTasksDialogPresenter(stage,this);
                stage.setTitle("Delete tasks");
                Scene scene = new Scene((Parent) deleteTasksDialogPresenter.loadView());
                // set css for view
                logger.trace("Loading CSS from: " + CSS_PATH);
                scene.getStylesheets().add(getClass().getResource(CSS_PATH).toExternalForm());
                stage.setScene(scene);
                stage.setResizable(false);
                stage.show();
            } catch (IOException e) {
                Utilities.showException(logger, "Cannot load dialog for deleting adapter!", e, false, null);
            }
        }
    }

    public void deleteTask(SimulationTask task){
        task.delete();
        for(Iterator<SimulationTask> i = getTasks().iterator();i.hasNext();){
            SimulationTask tmp = i.next();
            if(tmp.toString().equals(task.toString())){
                i.remove();
            }
        }
        //getTasks().remove(task);
        logger.debug("Tasks count after delete -> " + getTasks().size());
        getTasks().forEach(t->logger.trace(t.toString()));
        System.gc();
    }

    public void saveAll(ObservableList<SimulationTask> tasks){
        ObservableList<SimulationTask> taskToDelete;
        if(tasks == null){
            taskToDelete = getTasks();
        }else{
            taskToDelete = tasks;
        }
        if(taskToDelete.size() < 1) return;
        logger.trace("Saving tasks");
        Task<Document> worker = new Task<Document>() {
            @Override
            protected Document call() throws Exception {
                logger.trace("Creating XML file");
                updateMessage("Creating XML file");
                updateProgress(20,100);
                Document doc = DocumentFactory.getInstance().createDocument();
                doc.addElement("tasks");
                for(SimulationTask task : taskToDelete){
                    logger.debug("Saving task -> " + task.getId());
                    doc = task.saveToXml(doc);
                    logger.debug("Done saving task -> " + task.getId());
                }
                return doc;
            }

            @Override
            protected void failed() {
                super.failed();
                Utilities.showException(logger, "Saving to XML failed", getException(), false, null);
            }
        };
        worker.setOnSucceeded(event -> {
            logger.trace("Trying to save to XML file");
            String filename = Utilities.saveDialogForXML(window, SAVES_DEFAULT_DIR, worker.getValue().asXML());
            if(filename != null){
                showInformation("File saved", "Task/s successfully saved", "Saved to file \"" + filename + "\"");
                //tmpController.setSaved(true);
            }
        });
        //create thread for background process
        Thread th = new Thread(worker);
        th.setDaemon(true);
        //run background process
        th.start();
    }

    public void open(){
        logger.trace("Trying to load from XML file");
        try {
            String content = Utilities.loadDialogForXML(window, SAVES_DEFAULT_DIR);
            if(content == null) return;
            parseAndLoadXML(content);
        } catch (DocumentException e) {
            Utilities.showException(logger, "Cannot parse loaded file", e, false, null);
        }
    }

    private void parseAndLoadXML(String content)throws DocumentException{
        logger.trace("Parsing XML file");
        Document doc = DocumentHelper.parseText(content);
        //root element = <tasks>
        Element rootElement = doc.getRootElement();
        for(Iterator<Element> it = rootElement.elementIterator("task"); it.hasNext();){
            Element taskElement = it.next();
            logger.trace("XML -> Parsing new task");
            SimulationTask tmpTask = null;
            try{
                //-------------------------------- PARSE XML --------------------------
                logger.trace("XML task parse -> Parsing server info");
                Element serverElement = taskElement.element("server");
                String serverName = serverElement.attribute("name").getValue();
                String serverIp = serverElement.attribute("ip").getValue();
                Integer serverPort = Integer.valueOf(serverElement.attribute("port").getValue());
                String serverDb = serverElement.attribute("db").getValue();
                //parse parameters
                Element parametersElement = taskElement.element("parameters");
                int adaptersCount = Integer.valueOf(parametersElement.attributeValue("ada_count"));
                int start_id = Integer.valueOf(parametersElement.attributeValue("start_id"));
                double protocolVersion = Double.valueOf(parametersElement.attributeValue("protocol"));
                Element sensorsCountElement = parametersElement.element("sensors_count");
                long sensorsCountSeed = Long.valueOf(sensorsCountElement.attributeValue("seed"));
                int sensorsCountMin = Integer.valueOf(sensorsCountElement.attributeValue("min"));
                int sensorsCountMax = Integer.valueOf(sensorsCountElement.attributeValue("max"));
                Element refreshTimeElement = parametersElement.element("refresh_time");
                long refreshTimeSeed = Long.valueOf(refreshTimeElement.attributeValue("seed"));
                int refreshTimeMin = Integer.valueOf(refreshTimeElement.attributeValue("min"));
                int refreshTimeMax = Integer.valueOf(refreshTimeElement.attributeValue("max"));
                String saveDir = parametersElement.elementText("save_dir");
                String[] enabledValuesNames = parametersElement.elementText("enabled_values").split(",");
                long enabledValuesSeed = Long.valueOf(parametersElement.element("enabled_values").attributeValue("seed"));
                //stop conditions
                Element stopConditionsElement = taskElement.element("stop_conditions");
                //-- time duration
                Element timeDurationElement = stopConditionsElement.element("time_duration");
                boolean timeEnabled = Boolean.valueOf(timeDurationElement.attributeValue("enabled"));
                long timeInSec = 0;
                if(timeEnabled){
                    timeInSec = Long.valueOf(timeDurationElement.attributeValue("sec"));
                }
                //-- sent messages
                Element sentMessagesElement = stopConditionsElement.element("sent_messages");
                boolean sentEnabled = Boolean.valueOf(sentMessagesElement.attributeValue("enabled"));
                long sentMessagesCount = 0;
                if(sentEnabled){
                    sentMessagesCount = Long.valueOf(sentMessagesElement.attributeValue("count"));
                }
                //-- waiting messages
                Element waitingMessagesElement = stopConditionsElement.element("waiting_messages");
                boolean waitingEnabled = Boolean.valueOf(waitingMessagesElement.attributeValue("enabled"));
                long waitingMessagesCount = 0;
                if(waitingEnabled){
                    waitingMessagesCount = Long.valueOf(waitingMessagesElement.attributeValue("count"));
                }
                //---------------------------CREATE TASK --------------------------------------
                tmpTask = new SimulationTask();
                if(getTasks().size() == 0){
                    tmpTask.setId(0);
                }else{
                    tmpTask.setId(getTasks().get(getTasks().size()-1).getId()+1);
                }
                //create server
                logger.trace("Load task from XML -> creating server");
                tmpTask.createServer(false,serverName,serverIp,serverPort,serverDb);
                logger.trace("Load task from XML -> creating parameters");
                tmpTask.createTaskParameters(
                        adaptersCount,
                        ProtocolFactory.getVersion(protocolVersion),
                        start_id,
                        sensorsCountMin,
                        sensorsCountMax,
                        refreshTimeMin,
                        refreshTimeMax,
                        saveDir
                );
                tmpTask.setSensorCountGeneratorSeed(sensorsCountSeed);
                tmpTask.setRefreshTimeGeneratorSeed(refreshTimeSeed);
                tmpTask.setValueTypeGeneratorSeed(enabledValuesSeed);
                //register tracking responses per second
                tmpTask.getResponseTracker().registerSecondCounter(tmpTask.getTaskParameters().getStopWatch().timeProperty());
                //value parameters
                ObservableList<Value> tmpValues = FXCollections.observableArrayList();
                for(String s : enabledValuesNames){
                    tmpValues.add(ValueFactory.buildValue(s));
                }
                ValueParameters valueParameters = new ValueParameters();
                valueParameters.setEnabledValues(tmpValues);
                tmpTask.setValueParameters(valueParameters);
                //create logs
                logger.trace("Load task from XML -> Creating logs");
                tmpTask.createLog(getView().getLogTabPane());
                tmpTask.getLog().createLogs();
                //set message tracking (waiting and sent counter)
                logger.trace("Load task from XML -> Creating logs -> Enabling response tracking");
                tmpTask.getLog().getMessageTracker().setEnabled(true);
                //DON'T show to be sent messages
                tmpTask.getLog().setShowToBeSent(false);
                //set log to buffer
                logger.trace("Load task from XML -> Setting logs to buffer");
                try {
                    tmpTask.getLog().setBuffered(true,"task_"+tmpTask.getId()+"_",tmpTask.getTaskParameters().getSaveDir());
                    tmpTask.getLog().writeTaskLogHeaderToBuffer(tmpTask);
                } catch (IOException e) {
                    Utilities.showException(logger, "Cannot create buffer file for new task's log.", e, true, event -> quit());
                }
                //register stop conditions
                logger.trace("Load task from XML -> Creating stop conditions");
                StopCondition sc = tmpTask.createStopCondition();
                if(timeEnabled){
                    sc.registerTimeDurationWatcher(timeInSec);
                }
                if(sentEnabled){
                    sc.registerSentMessageWatcher(sentMessagesCount);
                }
                if(waitingEnabled){
                    sc.registerWaitingMessageWatcher(waitingMessagesCount);
                }
                //initialize adapters
                tmpTask.setSimulationState(SimulationTask.State.READY);
                //add QueueWatcher to task
                tmpTask.setQueueWatcher(getQueueWatcher());
                logger.trace("Load task from XML -> Adding task to list");
                getTasks().add(tmpTask);
            }catch (NullPointerException e){
                throw new DocumentException("Wrong format of file. Cannot find one or more required elements. Error on in content of tasks ",e);
            }
        }
    }

    public void print(){

    }

    public void queueProcessStart(){
        if(getQueueWatcher() == null){
            logger.warn("QueueWatcher is null");
            return;
        }
        if(getTasks().size() == 0 || checkMissingStopConditions()) return;
        try{
            getQueueWatcher().start();
        }catch (IllegalArgumentException e){
            logger.debug(e.getMessage());
            Utilities.showError("Choose time to start queue auto processing","Auto process queue");
        }
    }

    public void queueProcessStop(){
        if(getQueueWatcher() == null){
            logger.warn("QueueWatcher is null");
            return;
        }
        getQueueWatcher().stop();
    }

    private boolean checkMissingStopConditions(){
        String taskIds = "";
        for (SimulationTask t : getTasks()){
            if(t.getStopCondition().getConditionCounter() == 0){
                taskIds = (taskIds.isEmpty() ? "" : " , ") + t.getId();
            }
        }
        if(!taskIds.isEmpty()){
            Utilities.showError("Tasks " + taskIds + " don't have stop condition. Cannot run queue auto processing.","Auto queue process");
            return true;
        }else{
            return false;
        }
    }

    public void switchCurrentTask(SimulationTask newTask){
        Task<Object> worker = new Task<Object>() {
            @Override
            protected Object call() throws Exception {
                if(getCurrentTask() != null && newTask != null){
                    if(newTask.equals(getCurrentTask())) return null;
                    else if(getCurrentTask().getRunning()) getCurrentTask().stop();
                }
                if(newTask == null){
                    Platform.runLater(PerformanceSimulationPresenter.this::clearControlsBinding);
                    return null;
                }
                updateProgress(10,100);
                Platform.runLater(()->{
                    setStatus("Setting current task ->" + newTask.getId(),true);
                    //save new task as current
                    setCurrentTask(newTask);
                    //show task's server information
                    updateProgress(20,100);
                    serverDetailsPresenter.addModel(newTask.getServerController().getModel());
                    serverDetailsPresenter.addSenderProperty(null);
                    updateProgress(30,100);
                    Platform.runLater(()->taskDetailsPresenter.addModel(newTask));
                    updateProgress(40,100);
                    newTask.getResponseTracker().registerChart(responseChart);
                    updateProgress(80,100);
                    //bind control buttons to new task
                    bindTaskControlBtns();
                    //bind log areas to new task
                    bindLogs();
                    updateProgress(90,100);
                    //select current task in table
                    selectTaskInTable(newTask);
                    setStatus("Task/" + newTask.getId() + " set as current",false);
                });
                return null;
            }

            @Override
            protected void failed() {
                super.failed();
                Utilities.showException(logger, "Switching current task failed", getException(), false, null);
            }
        };
        //create thread for background process
        Thread th = new Thread(worker);
        th.setDaemon(true);
        //run background process
        th.start();
    }


    public void showFullLog(){
        if(hostServices != null && getCurrentTask()!= null && getCurrentTask().getLog().getBufferFile()!= null){
            hostServices.showDocument(getCurrentTask().getLog().getBufferFile().getAbsolutePath());
        }
    }

    public void init(Properties properties){
        logger.info("Initialization");
        //application initialisation
        startMemoryCheck();
        //load properties from .properties file
        this.properties = properties;
        //point logger to textArea
        TextAreaAppender.setTextFlow(view.getApplicationLogTextArea());
        //init presenters and save their views to GUI
        initPresentersAndViews();
        //bind task controls disable property
        bindControlBtnsToTasksCount();
        //create date time picker
        createDateTimePicker();
        //create and bind queue watcher
        this.queueWatcher = new QueueWatcher(this,getTasks());
        bindQueueWatcherControls();
        //init response chart
        this.responseChart = new ResponseChart(view.getResponseChartContainer());
        //init task table, set columns cell factories
        initTasksTable();
        view.getNewTaskItem().setDisable(false);
        view.getNewTaskTBtn().setDisable(false);
        view.getOpenTBtn().setDisable(false);
        view.getOpenItem().setDisable(false);
        Runtime.getRuntime().addShutdownHook(new Thread(){
            public void run(){
                quit();
                logger.info("Shutting down");
            }
        });
    }

    private void createDateTimePicker(){
        LocalDateTimeTextField l = new LocalDateTimeTextField();
        l.setPrefHeight(27);
        l.setPrefWidth(189);
        view.setStartDateTimeTextField(l);
        view.getQueueProcessContainer().getChildren().add(l);
    }

    private void bindLogs(){
        if(getCurrentTask()!= null && getCurrentTask().getLog() != null){
            AdapterLogger log = getCurrentTask().getLog();
            log.clearContainers();
            log.addAdapterLogTo(view.getAdapterLogContainer());
            log.addSentLogTo(view.getToBeSentLogContainer());
            log.addErrorLogTo(view.getErrorLogContainer());
        }
    }

    private void bindQueueWatcherControls(){
        if(getQueueWatcher() == null){
            logger.warn("QueueWatcher is null");
            return;
        }
        getQueueWatcher().initDateTimePicker(view.getStartDateTimeTextField());
        view.getQueueProcessOnBtn().disableProperty().bind(getQueueWatcher().enabledProperty());
        view.getQueueProcessOffBtn().disableProperty().bind(new BooleanBinding() {
            {
                bind(getQueueWatcher().enabledProperty());
            }
            @Override
            protected boolean computeValue() {
                return !getQueueWatcher().getEnabled();
            }
        });
        view.getImmediatelyStartRadBtn().selectedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                getQueueWatcher().setImmediateStart(newValue);
            }
        });
        view.getStartDateTimeTextField().disableProperty().bind(new BooleanBinding() {
            {
                bind(getQueueWatcher().enabledProperty());
            }
            @Override
            protected boolean computeValue() {
                return getQueueWatcher().getEnabled();
            }
        }.or(getQueueWatcher().immediateStartProperty()));
        view.getImmediatelyStartRadBtn().disableProperty().bind(getQueueWatcher().enabledProperty());
        view.getPickTimeStartRadBtn().disableProperty().bind(getQueueWatcher().enabledProperty());
    }

    @SuppressWarnings("unchecked")
    private void initTasksTable(){
        //checkbox column
        view.getEnabledColumn().setCellValueFactory(new SimulationTaskFactory());
        view.getEnabledColumn().setCellFactory(param -> new SimulationTaskEnabledCellFactory());
        //id column
        view.getIdColumn().setCellValueFactory(new SimulationTaskFactory());
        view.getIdColumn().setCellFactory(param -> new SimulationTaskIdCellFactory());
        //state column
        view.getStateColumn().setCellValueFactory(new SimulationTaskFactory());
        view.getStateColumn().setCellFactory(param -> new SimulationTaskStateCellFactory());
        //server column
        view.getServerColumn().setCellValueFactory(new SimulationTaskFactory());
        view.getServerColumn().setCellFactory(param -> new SimulationTaskServerCellFactory());
        //stop condition column
        view.getStopConditionColumn().setCellValueFactory(new SimulationTaskFactory());
        view.getStopConditionColumn().setCellFactory(param -> new SimulationTaskStopCellFactory());
        //set content for tasks table
        view.getTasksTable().setItems(getTasksList());
        //set click action
        view.getTasksTable().setRowFactory(tv->{
            TableRow<SimulationTask> row = new TableRow<>();
            row.setOnMouseClicked(event -> {
                if((!row.isEmpty()) && event.getClickCount() > 1 && !getQueueWatcher().getEnabled()){
                    SimulationTask task = row.getItem();
                    checkIfSwitchTasks(task);
                }
            });
            return row;
        });
    }

    private void checkIfSwitchTasks(SimulationTask newTask){
        logger.trace("Trying to switch tasks");
        if(newTask != null){
            if(getCurrentTask() == null || !getCurrentTask().getRunning()){
                logger.trace("Trying to switch to task: " + newTask.getId());
                switchCurrentTask(newTask);
                return;
            }
            if(newTask.equals(getCurrentTask())){
                logger.trace("Selected task is already current");
            }else {
                logger.trace("Showing switch conformation dialog");
                Alert dlg = new Alert(Alert.AlertType.CONFIRMATION,"");
                dlg.initModality(Modality.WINDOW_MODAL);
                dlg.initOwner(window);
                dlg.setTitle("Switch task");
                dlg.getDialogPane().setContentText("Current task is running. Do you wish to stop this task and switch to selected task?");
                dlg.showAndWait().ifPresent(result -> {
                    ButtonBar.ButtonData buttonData = result.getButtonData();
                    switch (buttonData){
                        case OK_DONE:
                            stopTask();
                            logger.trace("Trying to switch to task: " + newTask.getId());
                            switchCurrentTask(newTask);
                            break;
                        case CANCEL_CLOSE:
                            logger.trace("Cancel");
                            selectTaskInTable(getCurrentTask());
                            break;
                        }
                    });
            }
        }else {
            logger.error("Selected task is null");
        }
    }

    private void selectTaskInTable(SimulationTask task){
        view.getTasksTable().requestFocus();
        logger.debug("Focusing table on task: " + task.getId());
        int index = view.getTasksTable().getItems().indexOf(task);
        view.getTasksTable().getSelectionModel().select(index);
        view.getTasksTable().getFocusModel().focus(index);
    }

    private ObservableList<Value> generateEnabledValues(ObservableList<Value> tmpValuesList){
        Value emValue = ValueFactory.buildValue(Value.Type.SENSOR_EMISSIONS);
        emValue.setGenerateValue(false);
        //((EmissionsSensorValue) emValue).setGeneratorType(Value.Generator.NORMAL_DISTRIBUTION);

        Value humValue = ValueFactory.buildValue(Value.Type.SENSOR_HUMIDITY);
        humValue.setGenerateValue(false);
        //((HumiditySensorValue) humValue).setGeneratorType(Value.Generator.NORMAL_DISTRIBUTION);

        Value lightValue = ValueFactory.buildValue(Value.Type.SENSOR_LIGHT);
        lightValue.setGenerateValue(false);
        //((LightSensorValue) lightValue).setGeneratorType(Value.Generator.NORMAL_DISTRIBUTION);

        Value noiseValue = ValueFactory.buildValue(Value.Type.SENSOR_NOISE);
        noiseValue.setGenerateValue(false);
        //((NoiseSensorValue) noiseValue).setGeneratorType(Value.Generator.NORMAL_DISTRIBUTION);

        Value onOffValue = ValueFactory.buildValue(Value.Type.SENSOR_ON_OFF);
        onOffValue.setGenerateValue(false);
        //((OnOffSensorValue) onOffValue).setGeneratorType(Value.Generator.BOOLEAN_RANDOM);

        Value openCloseValue = ValueFactory.buildValue(Value.Type.SENSOR_OPEN_CLOSED);
        openCloseValue.setGenerateValue(false);
        //((OpenClosedSensorValue) openCloseValue).setGeneratorType(Value.Generator.BOOLEAN_RANDOM);

        Value pressureValue = ValueFactory.buildValue(Value.Type.SENSOR_PRESSURE);
        pressureValue.setGenerateValue(false);
        //((PressureSensorValue) pressureValue).setGeneratorType(Value.Generator.NORMAL_DISTRIBUTION);

        Value tempValue = ValueFactory.buildValue(Value.Type.SENSOR_TEMPERATURE);
        tempValue.setGenerateValue(false);
        //((TemperatureSensorValue) tempValue).setGeneratorType(Value.Generator.NORMAL_DISTRIBUTION);

        tmpValuesList.addAll(tempValue,humValue,emValue,noiseValue,lightValue,onOffValue,openCloseValue,pressureValue);
        return tmpValuesList;
    }

    private void clearControlsBinding(){
        if(view.getStartTaskItem().disableProperty().isBound()) view.getStartTaskItem().disableProperty().unbind();
        if(view.getStartTaskTBtn().disableProperty().isBound()) view.getStartTaskTBtn().disableProperty().unbind();

        if(view.getPauseTaskItem().disableProperty().isBound()) view.getPauseTaskItem().disableProperty().unbind();
        if(view.getPauseTaskTBtn().disableProperty().isBound()) view.getPauseTaskTBtn().disableProperty().unbind();

        if(view.getStopTaskItem().disableProperty().isBound()) view.getStopTaskItem().disableProperty().unbind();
        if(view.getStopTaskTBtn().disableProperty().isBound()) view.getStopTaskTBtn().disableProperty().unbind();

        if(view.getPauseSensorsItem().disableProperty().isBound()) view.getPauseSensorsItem().disableProperty().unbind();
        if(view.getPauseSensorsTBtn().disableProperty().isBound()) view.getPauseSensorsTBtn().disableProperty().unbind();

        if(view.getResumeSensorsItem().disableProperty().isBound()) view.getResumeSensorsItem().disableProperty().unbind();
        if(view.getResumeSensorsTBtn().disableProperty().isBound()) view.getResumeSensorsTBtn().disableProperty().unbind();

        view.getStartTaskItem().setDisable(true);
        view.getStartTaskTBtn().setDisable(true);

        view.getPauseTaskItem().setDisable(true);
        view.getPauseTaskTBtn().setDisable(true);

        view.getStopTaskItem().setDisable(true);
        view.getStopTaskTBtn().setDisable(true);

        view.getPauseSensorsItem().setDisable(true);
        view.getPauseSensorsTBtn().setDisable(true);

        view.getResumeSensorsItem().setDisable(true);
        view.getResumeSensorsTBtn().setDisable(true);

        setCurrentTask(null);
    }

    private void showAddTaskDialog(ObservableList<Server> servers){
        AddNewTaskDialogPresenter addNewTaskDialogPresenter;
        try{
            Stage stage = new Stage();
            addNewTaskDialogPresenter = new AddNewTaskDialogPresenter(stage,this,servers);
            stage.setTitle("Add new task");
            Scene scene = new Scene((Parent) addNewTaskDialogPresenter.loadView());
            // set css for view
            logger.trace("Loading CSS from: " + CSS_PATH);
            scene.getStylesheets().add(getClass().getResource(CSS_PATH).toExternalForm());
            stage.setScene(scene);
            stage.setResizable(false);
            stage.show();
        } catch (IOException e) {
            Utilities.showException(logger, "Cannot load dialog for task adapter!", e, false, null);
        } catch (IllegalArgumentException ei){
            Utilities.showException(logger, "Cannot create task. Error in properties file. Please review file an start application again.", ei, true, event -> quit());
        }
    }

    private void bindTaskControlBtns(){
        if(getCurrentTask() == null) return;
        //start buttons
        BooleanBinding startBinding = new BooleanBinding() {
            {
                bind(getCurrentTask().simulationStateProperty());
            }
            @Override
            protected boolean computeValue() {
                switch (getCurrentTask().getSimulationState()){
                    case RUNNING:
                        return true;
                    default:
                        return false;
                }
            }
        };
        view.getStartTaskTBtn().disableProperty().bind(startBinding);
        view.getStartTaskItem().disableProperty().bind(startBinding);
        //pause buttons
        BooleanBinding pauseBinding = new BooleanBinding() {
            {
                bind(getCurrentTask().simulationStateProperty());
            }
            @Override
            protected boolean computeValue() {
                switch (getCurrentTask().getSimulationState()){
                    case RUNNING:
                        return false;
                    default:
                        return true;
                }
            }
        };
        view.getPauseTaskTBtn().disableProperty().bind(pauseBinding);
        view.getPauseTaskItem().disableProperty().bind(pauseBinding);
        //start buttons
        BooleanBinding stopBinding = new BooleanBinding() {
            {
                bind(getCurrentTask().simulationStateProperty());
            }
            @Override
            protected boolean computeValue() {
                switch (getCurrentTask().getSimulationState()){
                    case RUNNING:
                    case PAUSED:
                        return false;
                    default:
                        return true;
                }
            }
        };
        view.getStopTaskTBtn().disableProperty().bind(stopBinding);
        view.getStartTaskItem().disableProperty().bind(stopBinding);
        //pause sensors buttons
        BooleanBinding pauseSensorsBinding = new BooleanBinding() {
            {
                bind(getCurrentTask().sensorsPausedProperty());
            }
            @Override
            protected boolean computeValue() {
                return getCurrentTask().getSensorsPaused();
            }
        }.or(new BooleanBinding() {
            {
                bind(getCurrentTask().simulationStateProperty());
            }

            @Override
            protected boolean computeValue() {
                switch (getCurrentTask().getSimulationState()) {
                    case RUNNING:
                    case PAUSED:
                        return false;
                    default:
                        return true;
                }
            }
        });
        view.getPauseSensorsTBtn().disableProperty().bind(pauseSensorsBinding);
        view.getPauseSensorsItem().disableProperty().bind(pauseSensorsBinding);
        //resume sensors buttons
        BooleanBinding resumeSensorsBinding = new BooleanBinding() {
            {
                bind(getCurrentTask().sensorsPausedProperty());
            }
            @Override
            protected boolean computeValue() {
                return !getCurrentTask().getSensorsPaused();
            }
        }.or(new BooleanBinding() {
            {
                bind(getCurrentTask().simulationStateProperty());
            }

            @Override
            protected boolean computeValue() {
                switch (getCurrentTask().getSimulationState()) {
                    case RUNNING:
                    case PAUSED:
                        return false;
                    default:
                        return true;
                }
            }
        });
        view.getResumeSensorsTBtn().disableProperty().bind(resumeSensorsBinding);
        view.getResumeSensorsItem().disableProperty().bind(resumeSensorsBinding);
    }

    private void bindControlBtnsToTasksCount(){
        BooleanBinding tasksListZeroReturnTrue = new BooleanBinding() {
            {
                bind(tasksListProperty().sizeProperty());
            }
            @Override
            protected boolean computeValue() {
                return getTasksList().size() <= 0;
            }
        }.or(new BooleanBinding() {
            {
                bind(currentTaskProperty());
            }
            @Override
            protected boolean computeValue() {
                return getCurrentTask() == null;
            }
        });
        BooleanBinding tasksListZero = new BooleanBinding() {
            {
                bind(tasksListProperty().sizeProperty());
            }
            @Override
            protected boolean computeValue() {
                return getTasksList().size() <= 0;
            }
        };
        view.getSaveAllBtn().disableProperty().bind(tasksListZero);
        //sim control buttons
        view.getStartTaskItem().disableProperty().bind(tasksListZeroReturnTrue);
        view.getStartTaskTBtn().disableProperty().bind(tasksListZeroReturnTrue);
        view.getStopTaskItem().disableProperty().bind(tasksListZeroReturnTrue);
        view.getStopTaskTBtn().disableProperty().bind(tasksListZeroReturnTrue);
        view.getPauseTaskItem().disableProperty().bind(tasksListZeroReturnTrue);
        view.getPauseTaskTBtn().disableProperty().bind(tasksListZeroReturnTrue);
        //sim sensors control
        view.getPauseSensorsItem().disableProperty().bind(tasksListZeroReturnTrue);
        view.getPauseSensorsTBtn().disableProperty().bind(tasksListZeroReturnTrue);
        view.getResumeSensorsItem().disableProperty().bind(tasksListZeroReturnTrue);
        view.getResumeSensorsTBtn().disableProperty().bind(tasksListZeroReturnTrue);
        //other
        view.getDeleteTaskTBtn().disableProperty().bind(tasksListZero);

    }

    private void showInformation(String title,String headerMessage,String message){
        logger.trace("Showing information");
        Alert dlg = new Alert(Alert.AlertType.INFORMATION, "");
        dlg.initModality(Modality.WINDOW_MODAL);
        dlg.initOwner(this.window);
        dlg.setTitle(title);
        dlg.getDialogPane().setContentText(message);
        dlg.getDialogPane().setHeaderText(headerMessage);
        dlg.show();
    }

    private void initPresentersAndViews(){
        //load server details
        try {
            serverDetailsPresenter = new ServerDetailsPresenter();
            view.addServerDetailsView(serverDetailsPresenter.loadView());
        } catch (IOException e) {
            Utilities.showException(logger, "Cannot load Server Details", e, true, event -> quit());
        }
        try {
            taskDetailsPresenter = new TaskDetailsPresenter();
            view.addTaskDetailsView(taskDetailsPresenter.loadView());
        } catch (IOException e) {
            Utilities.showException(logger, "Cannot load Server Details", e, true, event -> quit());
        }
        //init date time picker
        /*String DATE_TIME_PATTERN = "dd-MM-yyyy HH:mm:ss";
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(DATE_TIME_PATTERN);
        LocalDateTimeTextField dateTimePicker = new LocalDateTimeTextField(LocalDateTime.now());
        dateTimePicker.setMinWidth(150);
        dateTimePicker.setDateTimeFormatter(dateTimeFormatter);

        dateTimePicker.setLocalDateTimeRangeCallback(new Callback<LocalDateTimePicker.LocalDateTimeRange, Void>() {
            @Override
            public Void call(LocalDateTimePicker.LocalDateTimeRange param) {

                return null;
            }
        });
        Locale l = Locale.UK;
        dateTimePicker.setLocale(l);
        dateTimePicker.setAllowNull(false);

        view.getQueueProcessContainer().getChildren().add(dateTimePicker);*/
    }
    /**
     *  Load view from FXML file{@link com.iha.emulator.ui.simulations.performance.PerformanceSimulationPresenter#FXML_PATH} and after that
     *  bind the view with a presenter. Also assigns CSS file {@link com.iha.emulator.ui.simulations.performance.PerformanceSimulationPresenter#CSS_PATH}
     *   and creates {@link javafx.scene.Scene}, which is returned.
     *   @return scene created from loaded view
     * */
    public Scene loadView() throws IOException{
        logger.trace("Loading PerformanceSimulationView from: " + FXML_PATH);
        InputStream fxmlStream = null;
        try {
            //load resource FXML
            fxmlStream = getClass().getResourceAsStream(FXML_PATH);
            FXMLLoader loader = new FXMLLoader();
            loader.load(fxmlStream);
            //remember view
            view = loader.getController();
            //build scene
            Scene scene = new Scene((Parent) view.getView());
            // bind view and presenter
            bind();
            // set css for view
            logger.trace("Loading CSS from: " + CSS_PATH);
            scene.getStylesheets().add(getClass().getResource(CSS_PATH).toExternalForm());
            logger.trace("OK");
            return scene;
        }
        finally
        {
            if (fxmlStream != null) fxmlStream.close();
        }
    }

    public void setStatus(String status,boolean indicate){
        view.setStatusLine(status);
        view.setStatusIndicator(indicate);
        logger.info(status);
    }

    public void startMemoryCheck(){
        if(view != null && memoryChecker != null){
            logger.trace("Starting memory check");
            //assign where to show memory usage
            memoryChecker.setGuiElements(view.getMemCheckProgressBar(),view.getMemCheckStatusLabel());
            //start checking
            memoryChecker.start();
        }
    }

    private void dumpLogs(){
        if(getTasks() == null || getTasks().size() == 0) return;
        for(SimulationTask task : getTasks()){
            task.getLog().closeBuffer();
        }
    }

    @Override
    public void bind() {
        view.setPresenter(this);
    }

    public Display getView(){
        return this.view;
    }

    public void quit(){
        Platform.runLater(memoryChecker::stop);
        dumpLogs();
        Platform.exit();
    }

    public SimulationTask getCurrentTask() {
        return currentTask.get();
    }

    public ObjectProperty<SimulationTask> currentTaskProperty() {
        return currentTask;
    }

    public void setCurrentTask(SimulationTask currentTask) {
        this.currentTask.set(currentTask);
    }

    public ObservableList<SimulationTask> getTasksList() {
        return tasksList.get();
    }

    public ListProperty<SimulationTask> tasksListProperty() {
        return tasksList;
    }

    public ObservableList<SimulationTask> getTasks() {
        return tasksList.get();
    }

    public QueueWatcher getQueueWatcher() {
        return queueWatcher;
    }

    public HostServices getHostServices() {
        return hostServices;
    }

    public void setHostServices(HostServices hostServices) {
        this.hostServices = hostServices;
    }

    //endregion

}
