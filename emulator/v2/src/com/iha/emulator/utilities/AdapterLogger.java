package com.iha.emulator.utilities;

import com.iha.emulator.control.SensorController;
import javafx.application.Platform;
import javafx.beans.property.BooleanProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.Node;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TabPane;
import javafx.scene.text.Text;
import javafx.scene.text.TextFlow;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;

/**
 * Created by Shu on 27.11.2014.
 */
public class AdapterLogger {
    private static final Logger logger = LogManager.getLogger(AdapterLogger.class);

    private static final String TIME_PATTERN = "HH:mm:ss(SSS)";
    private static DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern(TIME_PATTERN);
    private static final int ERROR_TAB_INDEX = 2;

    private static final int BUFFER_LINE_COUNT_MAX = 100;

    public enum Type{
        FULL,
        PARTIAL,
        SHORT
    }

    public enum Style {
        REGULAR,
        BOLD
    }

    private Type actualType;

    private TabPane tabPane = null;

    private Node adapterLogContainer;
    private Node toBeSentLogContainer;
    private Node errorLogContainer;

    private TextFlow adapterLog;
    private TextFlow toBeSentLog;
    private TextFlow errorLog;

    private BooleanProperty fullMessage;
    private BooleanProperty partialMessage;
    private BooleanProperty shortMessage;

    private boolean buffered = false;
    private File bufferFile;
    private BufferedWriter bufferWriter;

    public AdapterLogger() {
        this.fullMessage = new SimpleBooleanProperty(true);
        this.partialMessage = new SimpleBooleanProperty(false);
        this.shortMessage = new SimpleBooleanProperty(false);
        bindChangeListener();
    }

    public AdapterLogger(TabPane tabPane){
        this();
        this.tabPane = tabPane;
    }

    public synchronized void log(String message){
        if(adapterLog!= null){
            //don't wont to show empty messages
            if(message.equals("")) return;
            String timeAndMessage = timeFormatter.format(LocalTime.now())  + " - " + message + "\n";
            //write message to file
            if(buffered && bufferWriter != null){
                try {
                    bufferWriter.write(timeAndMessage);
                    bufferWriter.flush();
                } catch (IOException e) {
                    Utilities.showException(logger,"Cannot write line \"" + message + "\" to buffer file!",e,false,null);
                }
            }
            //delete already buffered messages from log
            checkIfRemove();
            //write message to log
            addTextToLog(new Text(timeAndMessage));
            /*if(buffered && bufferWriter != null){
                if(adapterLog.getChildren().size() > BUFFER_LINE_COUNT_MAX){
                    ObservableList<Node> lines = adapterLog.getChildren();
                    for(int i = 0; i < BUFFER_LINE_COUNT_MAX - 5;i++){
                        try {
                            bufferWriter.write(((Text)lines.get(i)).getText());
                            bufferWriter.flush();
                        } catch (IOException e) {
                            DetailedSimulationPresenter.showException(logger,"Cannot write line " + i + " to buffer file!",e,false,null);
                        }
                    }
                    Platform.runLater(() -> lines.remove(0, BUFFER_LINE_COUNT_MAX - 5));
                }
            }
            Platform.runLater(() -> {
                adapterLog.getChildren().add(new Text(timeFormatter.format(LocalTime.now()) + " - " + message + "\n"));
                ((ScrollPane)adapterLogContainer).setVvalue(1.0);
            });*/
        }
    }

    public synchronized void checkIfRemove(){
        if(adapterLog.getChildren().size() > BUFFER_LINE_COUNT_MAX){
            Platform.runLater(()->adapterLog.getChildren().remove(0, BUFFER_LINE_COUNT_MAX/2));
        }
    }

    public synchronized void addTextToLog(Text text){
        Platform.runLater(()->{
            adapterLog.getChildren().add(text);
            ((ScrollPane)adapterLogContainer).setVvalue(1.0);
        });
    }

    public synchronized Text sent(String message){
        Text messageText = new Text(timeFormatter.format(LocalTime.now()) + " - " + message + "\n");
        Platform.runLater(() -> {
            if(toBeSentLog!= null){
                toBeSentLog.getChildren().add(messageText);
            }
        });
        return messageText;
    }

    public synchronized void error(String message){
        Platform.runLater(() -> {
            if(errorLog!= null){
                errorLog.getChildren().add(new Text(timeFormatter.format(LocalTime.now()) + " - " + message + "\n"));
                if(tabPane != null) tabPane.getSelectionModel().select(ERROR_TAB_INDEX);
            }
        });
    }

    public synchronized void notifyDataSent(){
        if(toBeSentLog.getChildren().size() > 0){
            Platform.runLater(() -> toBeSentLog.getChildren().remove(0));
        }else{
            logger.error("Trying to remove first toBeSent line, but there are no lines");
        }
    }

    public synchronized void notifyDataSent(Text message){
        if(toBeSentLog.getChildren().size() > 0){
            Platform.runLater(() -> toBeSentLog.getChildren().remove(message));
        }else{
            logger.error("Trying to remove first toBeSent line, but there are no lines");
        }
    }

    public TextFlow addAdapterLogTo(Node container){
        //create new textArea
        if(adapterLog == null){
            adapterLog = new TextFlow();
            stylize(adapterLog);
        }
        ScrollPane paneContainer = (ScrollPane) container;
        paneContainer.setContent(adapterLog);
        paneContainer.setFitToWidth(true);
        this.adapterLogContainer = container;
        return adapterLog;
    }

    public TextFlow addSentLogTo(Node container){
        //create new textArea
        if(toBeSentLog == null){
            toBeSentLog = new TextFlow();
            stylize(toBeSentLog);
        }
        ScrollPane paneContainer = (ScrollPane) container;
        paneContainer.setContent(toBeSentLog);
        paneContainer.setFitToWidth(true);
        this.toBeSentLogContainer = container;
        return toBeSentLog;
    }

    public TextFlow addErrorLogTo(Node container){
        //create new textArea
        if(errorLog == null){
            errorLog = new TextFlow();
            stylize(errorLog);
        }
        ScrollPane paneContainer = (ScrollPane) container;
        paneContainer.setContent(errorLog);
        paneContainer.setFitToWidth(true);
        this.errorLogContainer = container;
        return errorLog;
    }

    public void clearContainers(){
        if(this.adapterLogContainer != null){
            ((ScrollPane)adapterLogContainer).setContent(null);
        }
        if(this.toBeSentLogContainer != null){
            ((ScrollPane)toBeSentLogContainer).setContent(null);
        }
        if(this.errorLogContainer != null){
            ((ScrollPane)errorLogContainer).setContent(null);
        }
    }

    public void delete(){
        closeBuffer();
        adapterLog.getChildren().clear();
        toBeSentLog.getChildren().clear();
        errorLog.getChildren().clear();
    }

    public void closeBuffer(){
        if(this.bufferWriter != null){
            try {
                bufferWriter.flush();
                bufferWriter.close();
                bufferFile.delete();
            } catch (IOException e) {
                Utilities.showException(logger,"Cannot close adapter logger buffer",e,false,null);
            }
        }
    }

    public synchronized void removeUnsentMessagesBySensor(SensorController sensorController){
        if(toBeSentLog != null && toBeSentLog.getChildren().size() !=0){
            for (Iterator<Node> it = toBeSentLog.getChildren().iterator(); it.hasNext(); ) {
                Node child = it.next();
                if (Utilities.containsIgnoreCase(((Text) child).getText(), sensorController.toString())) {
                    it.remove();
                }
            }
        }
    }

    private void stylize(TextFlow area){
        area.getStyleClass().addAll("logTextArea");
    }

    private void bindChangeListener(){
        this.fullMessage.addListener(new MessageTypeChangeListener(Type.FULL));
        this.partialMessage.addListener(new MessageTypeChangeListener(Type.PARTIAL));
        this.shortMessage.addListener(new MessageTypeChangeListener(Type.SHORT));
    }

    public void setBuffered(boolean buffered,String filename) throws IOException {
        this.buffered = buffered;
        if(buffered){
            if(bufferFile == null){
                bufferFile = File.createTempFile(filename ,".tmp");
                logger.trace("Temp file location: " + bufferFile.getAbsolutePath());
                bufferWriter = new BufferedWriter(new FileWriter(bufferFile));
                logger.debug("Created  log buffer file.");
            }
        }
        logger.debug("Log is now buffered");
    }

    public static Type toType(String typeString){
        String lowerTypeString = typeString.toLowerCase();
        Type type;
        switch (lowerTypeString){
            case "full":
                type = Type.FULL;
                break;
            case "partial":
                type = Type.PARTIAL;
                break;
            case "short":
                type = Type.SHORT;
                break;
            default:
                throw new IllegalArgumentException("Unknown value of property \"defaultLogMessageType\" ->" + typeString +" -> has to be: FULL or PARTIAL or SHORT");
        }
        return type;
    }

    public void setType(Type type){
        this.actualType = type;
    }

    @SuppressWarnings("unused")
    public TextFlow getAdapterLog() {
        return adapterLog;
    }

    @SuppressWarnings("unused")
    public TextFlow getToBeSentLog() {
        return toBeSentLog;
    }

    @SuppressWarnings("unused")
    public TextFlow getErrorLog() {
        return errorLog;
    }

    @SuppressWarnings("unused")
    public boolean getFullMessage() {
        return fullMessage.get();
    }

    public BooleanProperty fullMessageProperty() {
        return fullMessage;
    }

    @SuppressWarnings("unused")
    public void setFullMessage(boolean fullMessage) {
        this.fullMessage.set(fullMessage);
    }

    @SuppressWarnings("unused")
    public boolean getPartialMessage() {
        return partialMessage.get();
    }

    public BooleanProperty partialMessageProperty() {
        return partialMessage;
    }

    @SuppressWarnings("unused")
    public void setPartialMessage(boolean partialMessage) {
        this.partialMessage.set(partialMessage);
    }

    @SuppressWarnings("unused")
    public boolean getShortMessage() {
        return shortMessage.get();
    }

    public BooleanProperty shortMessageProperty() {
        return shortMessage;
    }

    public File getBufferFile(){
        return bufferFile;
    }

    @SuppressWarnings("unused")
    public void setShortMessage(boolean shortMessage) {
        this.shortMessage.set(shortMessage);
    }

    private class MessageTypeChangeListener implements ChangeListener<Boolean> {

        private Type type;

        public MessageTypeChangeListener(Type type){
            super();
            this.type = type;
        }

        @Override
        public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
            if(newValue) actualType = this.getType();
        }

        private Type getType() {
            return type;
        }
    }
}
