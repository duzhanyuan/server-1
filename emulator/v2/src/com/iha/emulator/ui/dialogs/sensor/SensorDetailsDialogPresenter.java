package com.iha.emulator.ui.dialogs.sensor;

import com.iha.emulator.control.SensorController;
import com.iha.emulator.models.value.HasBooleanRandom;
import com.iha.emulator.models.value.HasLinearDistribution;
import com.iha.emulator.models.value.HasNormalDistribution;
import com.iha.emulator.models.value.Value;
import com.iha.emulator.models.value.implemented.EmptyValue;
import com.iha.emulator.models.value.implemented.HasGenerator;
import com.iha.emulator.resources.images.sensor_types.SensorIcon;
import com.iha.emulator.ui.Presenter;
import com.iha.emulator.ui.panels.PanelPresenter;
import com.iha.emulator.utilities.Utilities;
import javafx.beans.binding.BooleanBinding;
import javafx.beans.binding.StringBinding;
import javafx.beans.property.BooleanProperty;
import javafx.beans.property.ListProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.property.SimpleListProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Callback;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.controlsfx.validation.ValidationMessage;
import org.controlsfx.validation.ValidationResult;
import org.controlsfx.validation.ValidationSupport;
import org.controlsfx.validation.Validator;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Objects;

import static com.iha.emulator.models.value.Value.Generator;

/**
 * Created by Shu on 10.12.2014.
 */
public class SensorDetailsDialogPresenter implements Presenter,PanelPresenter{

    private static final Logger logger = LogManager.getLogger(SensorDetailsDialogPresenter.class);
    private static final String FXML_PATH = "SensorDetailsDialog.fxml";
    private static final double REFRESH_SLIDER_VALUE_COUNT = 16;
    private static final String[] DEFAULT_COLORS = {
            "0cdf56", "65c2ff", "ffe037", "fe9e49", "ffff81", "db8fff"
    };
    private Display view;
    private Stage window;

    private SensorController sensorController;
    private BooleanProperty sensorInfoSet;
    private BooleanProperty valueInfoSet;
    private ValidationSupport sensorGeneralValidator = new ValidationSupport();
    private String valueValidationMessage = "";
    private ValidationSupport valueValidator;
    private final DecimalFormat signalBatterySliderFormatter = new DecimalFormat( "##0" );
    private ListProperty<Value> values;

    public interface Display{
        public Node getView();
        public void setPresenter(SensorDetailsDialogPresenter presenter);
        public TextField getSensorIdLbl();
        public TextField getSensorNameLbl();
        public ComboBox getSensorIconComboBox();
        public ColorPicker getSensorColorPicker();
        public Slider getSensorBatterySlider();
        public Slider getSensorSignalSlider();
        public Slider getSensorRefreshSlider();
        public Label getSensorBatteryValueLbl();
        public Label getSensorSignalValueLbl();
        public Label getSensorRefreshValueLbl();
        public Label getSensorHeaderSampleLbl();
        public TreeView getValuesTree();
        public VBox getValuesPanelContainer();
        public Label getNoValueSelectedLbl();
        public TextField getValueTypeTextField();
        public TextField getValueNameTextField();
        public TextField getValueTextField();
        public ComboBox getValueComboBox();
        public RadioButton getValueYesStoreHistoryRadBtn();
        public RadioButton getValueNoStoreHistoryRadBtn();
        public RadioButton getValueYesGenerateValueRadBtn();
        public RadioButton getValueNoGenerateValueRadBtn();
        public StackPane getGeneratorsContainer();
        public Label getGeneratorTypeLbl();
        public ComboBox getGeneratorTypeComboBox();
        public GridPane getNormalDistributionContainer();
        public TextField getMinNormalTextField();
        public TextField getMaxNormalTextField();
        public TextField getDevNormalTextField();
        public TextField getAvgNormalTextField();
        public GridPane getLinearDistributionContainer();
        public TextField getMinLinearTextField();
        public TextField getMaxLinearTextField();
        public TextField getStepLinearTextField();
        public GridPane getBooleanRandomContainer();
        public Slider getBooleanRandomProbabilitySlider();
        public Label getBooleanRandomProbabilityLbl();
        public Button getSaveValueBtn();
    }

    // SUGGESTION change valueTextField to show combo box when value is of type boolean
    public SensorDetailsDialogPresenter(Stage window, SensorController sensorController) {
        this.window = window;
        this.sensorInfoSet = new SimpleBooleanProperty(false);
        this.valueInfoSet = new SimpleBooleanProperty(false);
        this.sensorController = sensorController;
    }

    public void save() {
        if(getSensorInfoSet() && getValueInfoSet() && values.size() > 0){
            if(!sensorController.getModel().getName().equals(view.getSensorNameLbl().getText())){
                logger.trace("Changing sensor name (old/new) -> " + sensorController.getModel().getName() + "/" + view.getSensorNameLbl().getText());
                sensorController.getModel().setName(view.getSensorNameLbl().getText());
            }
            if(sensorController.getModel().getBattery() != Double.valueOf(view.getSensorBatterySlider().getValue()).intValue()){
                logger.trace("Changing sensor battery (old/new) -> " + sensorController.getModel().getBattery() + "/" + Double.valueOf(view.getSensorBatterySlider().getValue()).intValue());
                sensorController.getModel().setBattery(Double.valueOf(view.getSensorBatterySlider().getValue()).intValue());
            }
            if(sensorController.getModel().getSignal() != Double.valueOf(view.getSensorSignalSlider().getValue()).intValue()){
                logger.trace("Changing sensor signal (old/new) -> " + sensorController.getModel().getSignal() + "/" + Double.valueOf(view.getSensorSignalSlider().getValue()).intValue());
                sensorController.getModel().setSignal(Double.valueOf(view.getSensorSignalSlider().getValue()).intValue());
            }
            if(sensorController.getModel().getRefreshTime() != Utilities.refreshSliderScaleToSeconds(view.getSensorRefreshSlider().getValue())){
                logger.trace("Changing sensor refresh (old/new) -> " + sensorController.getModel().getRefreshTime() + "/" + Utilities.refreshSliderScaleToSeconds(view.getSensorRefreshSlider().getValue()));
                sensorController.setNewRefreshTime(Utilities.refreshSliderScaleToSeconds(view.getSensorRefreshSlider().getValue()));
            }
            if(!sensorController.getPanel().getIconType().equals(view.getSensorIconComboBox().getSelectionModel().getSelectedItem())){
                logger.trace("Changing sensor icon (old/new) -> " + sensorController.getPanel().getIconType().getName() + "/" + ((SensorIcon)view.getSensorIconComboBox().getSelectionModel().getSelectedItem()).getName());
                sensorController.getPanel().setIcon((SensorIcon) view.getSensorIconComboBox().getSelectionModel().getSelectedItem());
            }
            if(!sensorController.getPanel().getHexHeaderColor().equals(Utilities.toRGBCode(view.getSensorColorPicker().getValue())) ){
                logger.trace("Changing sensor color (old/new) -> " + sensorController.getPanel().getHexHeaderColor() + "/" + Utilities.toRGBCode(view.getSensorColorPicker().getValue()));
                sensorController.getPanel().setHeaderColor(Utilities.toRGBCode(view.getSensorColorPicker().getValue()));
            }
            cancel();
        }else {
            showMissingInfoWarning(false);
        }
    }

    public void cancel() {
        window.hide();
    }

    protected void addValueToTree(Value newValue) {
        logger.debug("Adding new value to tree: " + newValue.getName());
        TreeItem newItem = new TreeItem<>(newValue);
        view.getValuesTree().getRoot().getChildren().add(newItem);
        view.getValuesTree().getSelectionModel().select(newItem);
    }

    protected void prepareValueInfoContainer(Value value){
        logger.trace("Preparing value information container for new value");
        clearValueInformation();
        valueValidator = new ValidationSupport();

        //show needed radio buttons
        if(value.getValueType().getGenerators() != null){
            for(Generator generator: value.getValueType().getGenerators()){
                switch (generator){
                    case NORMAL_DISTRIBUTION:
                        view.getGeneratorTypeComboBox().getItems().add(Generator.NORMAL_DISTRIBUTION);
                        view.getMaxNormalTextField().setText(String.valueOf(((HasNormalDistribution)value).getMax()));
                        view.getMinNormalTextField().setText(String.valueOf(((HasNormalDistribution)value).getMin()));
                        view.getDevNormalTextField().setText(String.valueOf(((HasNormalDistribution)value).getDev()));
                        view.getAvgNormalTextField().setText(String.valueOf(((HasNormalDistribution)value).getAvg()));
                        break;
                    case LINEAR_DISTRIBUTION:
                        view.getGeneratorTypeComboBox().getItems().add(Generator.LINEAR_DISTRIBUTION);
                        view.getMaxLinearTextField().setText(String.valueOf(((HasLinearDistribution)value).getMax()));
                        view.getMinLinearTextField().setText(String.valueOf(((HasLinearDistribution)value).getMin()));
                        view.getStepLinearTextField().setText(String.valueOf(((HasLinearDistribution)value).getStep()));
                        break;
                    case BOOLEAN_RANDOM:
                        view.getGeneratorTypeComboBox().getItems().add(Generator.BOOLEAN_RANDOM);
                        view.getBooleanRandomProbabilitySlider().setValue(((HasBooleanRandom)value).getProbability()*100);
                        break;
                    default:
                        break;
                }
            }
            view.getValueYesGenerateValueRadBtn().setDisable(false);
        }else {
            view.getValueYesGenerateValueRadBtn().setDisable(true);
        }
        try{
            Generator generator =((HasGenerator)value).getGeneratorType();
            if(generator != null){
                logger.trace("Setting generator");
                switch (generator){
                    case NORMAL_DISTRIBUTION:
                        logger.trace("setting NORMAL_DISTRIBUTION");
                        view.getGeneratorTypeComboBox().getSelectionModel().select(Generator.NORMAL_DISTRIBUTION);
                        view.getMaxNormalTextField().setText(String.valueOf(((HasNormalDistribution)value).getMax()));
                        view.getMinNormalTextField().setText(String.valueOf(((HasNormalDistribution)value).getMin()));
                        view.getDevNormalTextField().setText(String.valueOf(((HasNormalDistribution)value).getDev()));
                        view.getAvgNormalTextField().setText(String.valueOf(((HasNormalDistribution)value).getAvg()));
                        break;
                    case LINEAR_DISTRIBUTION:
                        logger.trace("setting LINEAR_DISTRIBUTION");
                        view.getGeneratorTypeComboBox().getSelectionModel().select(Generator.LINEAR_DISTRIBUTION);
                        view.getMaxLinearTextField().setText(String.valueOf(((HasLinearDistribution)value).getMax()));
                        view.getMinLinearTextField().setText(String.valueOf(((HasLinearDistribution)value).getMin()));
                        view.getStepLinearTextField().setText(String.valueOf(((HasLinearDistribution)value).getStep()));
                        break;
                    case BOOLEAN_RANDOM:
                        logger.trace("setting BOOLEAN_RANDOM");
                        view.getGeneratorTypeComboBox().getSelectionModel().select(Generator.BOOLEAN_RANDOM);
                        view.getBooleanRandomProbabilitySlider().setValue(((HasBooleanRandom)value).getProbability()*100);
                        break;
                    default:
                        break;
                }
            }else {
                logger.trace("Value doesn't have generator");
            }
        }catch (Exception e){
            logger.trace("Doesn't have generator",e);
        }
        view.getValueTypeTextField().setText(value.getValueType().getName());
        view.getValueNameTextField().setText(value.getName());
        //if value is type boolean, show checkbox, else textfield
        if(value.getValue() instanceof Boolean){
            view.getValueTextField().setVisible(false);
            view.getValueComboBox().setVisible(true);
            if((Boolean) value.getValue()){
                view.getValueComboBox().getSelectionModel().select("ON");
            }else{
                view.getValueComboBox().getSelectionModel().select("OFF");
            }
        }else{
            view.getValueTextField().setVisible(true);
            view.getValueComboBox().setVisible(false);
            view.getValueTextField().setText(String.valueOf(value.getValue()));
        }
        view.getValueYesStoreHistoryRadBtn().setSelected(value.isStoreHistory());
        view.getValueNoStoreHistoryRadBtn().setSelected(!value.isStoreHistory());
        view.getValueYesGenerateValueRadBtn().setSelected(value.isGenerateValue());
        view.getValueNoGenerateValueRadBtn().setSelected(!value.isGenerateValue());
        view.getSaveValueBtn().setOnAction(null);
        view.getSaveValueBtn().setOnAction(event -> {
            validateSaveValue();
        });
        setValueInfoSet(true);
    }

    private void clearValueInformation(){
        //clear generator combo box
        view.getGeneratorTypeComboBox().getSelectionModel().clearSelection();
        view.getGeneratorTypeComboBox().getItems().clear();
        view.getValueTypeTextField().clear();
        view.getValueNameTextField().clear();
        view.getValueTextField().clear();
        view.getMinNormalTextField().clear();
        view.getMaxNormalTextField().clear();
        view.getDevNormalTextField().clear();
        view.getAvgNormalTextField().clear();
        view.getMinLinearTextField().clear();
        view.getMaxLinearTextField().clear();
        view.getStepLinearTextField().clear();
    }

    private void validateSaveValue(){
        valueValidationMessage = "";
        if(view.getValueNameTextField().getText().equals(""))
            valueValidationMessage = "Name is required" + "\n";
        if(view.getValueTextField().isVisible() && view.getValueTextField().getText().equals(""))
            valueValidationMessage = valueValidationMessage +  "Value is required" + "\n";
        if(view.getValueYesGenerateValueRadBtn().isSelected() && view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem() == null){
            valueValidationMessage = valueValidationMessage +  "No generator selected" + "\n";
        }else if(view.getValueYesGenerateValueRadBtn().isSelected() && view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem().equals(Generator.NORMAL_DISTRIBUTION)){
            if(view.getMinNormalTextField().getText().equals(""))
                valueValidationMessage = valueValidationMessage +  "Normal distribution minimum is required" + "\n";
            if(view.getMaxNormalTextField().getText().equals(""))
                valueValidationMessage = valueValidationMessage +  "Normal distribution maximum is required" + "\n";
            if(view.getAvgNormalTextField().getText().equals(""))
                valueValidationMessage = valueValidationMessage +  "Normal distribution average is required" + "\n";
            if(view.getDevNormalTextField().getText().equals(""))
                valueValidationMessage = valueValidationMessage +  "Normal distribution deviation is required" + "\n";
        }else if(view.getValueYesGenerateValueRadBtn().isSelected() && view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem().equals(Generator.LINEAR_DISTRIBUTION)){
            if(view.getMinLinearTextField().getText().equals(""))
                valueValidationMessage = valueValidationMessage +  "Linear distribution minimum is required" + "\n";
            if(view.getMaxLinearTextField().getText().equals(""))
                valueValidationMessage = valueValidationMessage +  "Linear distribution maximum is required" + "\n";
            if(view.getStepLinearTextField().getText().equals(""))
                valueValidationMessage = valueValidationMessage +  "Linear distribution step is required" + "\n";
        }
        if(valueValidationMessage.equals("")){
            saveValue();
        }else{
            showWarning("Value information","Please fill all necessary information",valueValidationMessage);
        }
    }

    private void saveValue(){
        logger.trace("Saving information to value");
        Value value = (Value) ((TreeItem)view.getValuesTree().getSelectionModel().getSelectedItem()).getValue();
        try{
            if(view.getValueTextField().isVisible()){
                value.setValue(value.fromStringToValueType(view.getValueTextField().getText()));
            }else if(view.getValueComboBox().isVisible()){
                value.setValue(value.fromStringToValueType(view.getValueComboBox().getSelectionModel().getSelectedItem().equals("ON") ? "true" : "false"));
            }
        }catch (NumberFormatException e){
            showWarning("Value information","Cannot parse value. Is it correct datatype?",null);
            return;
        }
        try{
            if(view.getValueYesGenerateValueRadBtn().isSelected() && view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem().equals(Generator.NORMAL_DISTRIBUTION)){
                logger.trace("Saving NORMAL generator");
                ((HasNormalDistribution)value).setAvg(Double.valueOf(view.getAvgNormalTextField().getText()));
                ((HasNormalDistribution)value).setDev(Double.valueOf(view.getDevNormalTextField().getText()));
                ((HasNormalDistribution)value).setMax(Double.valueOf(view.getMaxNormalTextField().getText()));
                ((HasNormalDistribution)value).setMin(Double.valueOf(view.getMinNormalTextField().getText()));
                ((HasGenerator)value).setGeneratorType(Generator.NORMAL_DISTRIBUTION);
            }else if(view.getValueYesGenerateValueRadBtn().isSelected() && view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem().equals(Generator.LINEAR_DISTRIBUTION)){
                logger.trace("Saving LINEAR generator");
                ((HasLinearDistribution)value).setStep(Double.valueOf(view.getStepLinearTextField().getText()));
                ((HasLinearDistribution)value).setMax(Double.valueOf(view.getMaxLinearTextField().getText()));
                ((HasLinearDistribution)value).setMin(Double.valueOf(view.getMinLinearTextField().getText()));
                ((HasGenerator)value).setGeneratorType(Generator.LINEAR_DISTRIBUTION);
            }else if(view.getValueYesGenerateValueRadBtn().isSelected() && view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem().equals(Generator.BOOLEAN_RANDOM)){
                ((HasBooleanRandom)value).setProbability(view.getBooleanRandomProbabilitySlider().getValue() / 100);
                ((HasGenerator)value).setGeneratorType(Generator.BOOLEAN_RANDOM);
            }
        }catch (NumberFormatException e){
            showWarning("Value information","Cannot parse distribution values.",null);
            return;
        }
        value.setName(view.getValueNameTextField().getText());
        value.setStoreHistory(view.getValueYesStoreHistoryRadBtn().isSelected());
        value.setGenerateValue(view.getValueYesGenerateValueRadBtn().isSelected());
        if(view.getValueTextField().isVisible() && !view.getValueTextField().getText().equals(String.valueOf(value.getInitialValue()))){
            value.setInitialValue(value.fromStringToValueType(view.getValueTextField().getText()));
        }else if(view.getValueComboBox().isVisible()
                && !(view.getValueComboBox().getSelectionModel().getSelectedItem().equals("ON") ? "true" : "false")
                    .equals(String.valueOf(value.getInitialValue()))){
            value.setInitialValue(value.fromStringToValueType(view.getValueComboBox().getSelectionModel().getSelectedItem().equals("ON") ? "true" : "false"));
        }
        logger.trace("Updating tree");
        updateTree();
        setValueInfoSet(true);
        logger.trace("OK");
    }

    private void listenToValueChanges(){
        logger.trace("Adding value information change listeners");
        ChangeListener<Boolean> radBtnChangeListener = (observable, oldValue, newValue) ->
                setValueInfoSet(false);
        ChangeListener<String> textFieldChangeListener = (observable, oldValue, newValue) -> {
                setValueInfoSet(oldValue.equals(newValue));
        };
        //general info
        view.getValueNameTextField().textProperty().addListener(textFieldChangeListener);
        view.getValueTextField().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if(view.getValueTextField().isVisible()){
                    setValueInfoSet(oldValue.equals(newValue));
                }
            }
        });
        view.getValueComboBox().getSelectionModel().selectedItemProperty().addListener((observable, oldValue, newValue) -> {
            if(oldValue != null && view.getValueComboBox().isVisible())
                setValueInfoSet(oldValue.equals(newValue));
        });
        // store history
        view.getValueYesStoreHistoryRadBtn().selectedProperty().addListener(radBtnChangeListener);
        view.getValueNoStoreHistoryRadBtn().selectedProperty().addListener(radBtnChangeListener);
        //generator
        view.getValueYesGenerateValueRadBtn().selectedProperty().addListener(radBtnChangeListener);
        view.getValueNoGenerateValueRadBtn().selectedProperty().addListener(radBtnChangeListener);
        view.getGeneratorTypeComboBox().getSelectionModel().selectedItemProperty().addListener((observable, oldValue, newValue) -> {
            setValueInfoSet(false);
        });
        //generator text fields
        view.getMinNormalTextField().textProperty().addListener(textFieldChangeListener);
        view.getMaxNormalTextField().textProperty().addListener(textFieldChangeListener);
        view.getDevNormalTextField().textProperty().addListener(textFieldChangeListener);
        view.getAvgNormalTextField().textProperty().addListener(textFieldChangeListener);

        view.getMaxLinearTextField().textProperty().addListener(textFieldChangeListener);
        view.getMinLinearTextField().textProperty().addListener(textFieldChangeListener);
        view.getStepLinearTextField().textProperty().addListener(textFieldChangeListener);

        view.getBooleanRandomProbabilitySlider().valueProperty().addListener(new ChangeListener<Number>() {
            @Override
            public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {
                setValueInfoSet(Objects.equals(oldValue, newValue));
            }
        });
    }

    private void showWarning(String title,String headerMessage,String message){
        logger.trace("Showing warning");
        Alert dlg = new Alert(Alert.AlertType.WARNING, "");
        dlg.initModality(Modality.WINDOW_MODAL);
        dlg.initOwner(this.window);
        dlg.setTitle(title);
        dlg.getDialogPane().setContentText(message);
        dlg.getDialogPane().setHeaderText(headerMessage);
        dlg.show();
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

    private void showMissingInfoWarning(boolean valueInfoOnly){
        logger.trace("Sensor info not filled. Cannot \"Finish\" dialog");
        String message = null;
        if(!valueInfoOnly){
            for(ValidationMessage msg : sensorGeneralValidator.getValidationResult().getErrors()){
                if(message == null){
                    message = msg.getText();
                }else {
                    message = message + "\n"  + msg.getText();
                }
            }
        }
        if(valueValidationMessage == null || valueValidationMessage.equals("")){
            valueValidationMessage = "\nMake sure value information are saved.";
        }
        if(message == null) message = "";
        showWarning("Sensor information","Please fill all necessary information",message + valueValidationMessage);
    }

    @Override
    public Node loadView() throws IOException {
        logger.trace("Loading AddNewSensorView from: " + FXML_PATH);
        InputStream fxmlStream = null;
        try
        {
            //load resource FXML
            fxmlStream = getClass().getResourceAsStream(FXML_PATH);
            FXMLLoader loader = new FXMLLoader();
            loader.load(fxmlStream);
            //remember view
            view = loader.getController();
            // bind view and presenter
            bind();
            initialize();
            fillDialog();
            logger.trace("OK");
            return view.getView();
        }
        finally
        {
            if (fxmlStream != null) fxmlStream.close();
        }
    }

    @SuppressWarnings("unchecked")
    private void fillDialog(){
        view.getSensorIdLbl().setText(sensorController.getSensorIdAsIp());
        view.getSensorNameLbl().setText(sensorController.getModel().getName());
        view.getSensorBatterySlider().setValue((double) sensorController.getModel().getBattery());
        view.getSensorSignalSlider().setValue((double)sensorController.getModel().getSignal());
        view.getSensorRefreshSlider().setValue(Utilities.secondsToRefershSliderScale(sensorController.getModel().getRefreshTime()));
        view.getSensorIconComboBox().getSelectionModel().select(sensorController.getPanel().getIconType());
        view.getSensorColorPicker().setValue(Color.web(sensorController.getPanel().getHexHeaderColor()));
    }

    @SuppressWarnings("unchecked")
    private void initialize(){
        //populate sensor icon combo box
        view.getSensorIconComboBox().setItems(getSensorIcons());
        view.getSensorIconComboBox().setCellFactory(new Callback<ListView<SensorIcon>, ListCell<SensorIcon>>() {
            @Override
            public ListCell call(ListView<SensorIcon> icon) {
                return new ListCell<SensorIcon>() {
                    @Override
                    protected void updateItem(SensorIcon s, boolean bln) {
                        super.updateItem(s, bln);
                        if (s != null) {
                            ImageView image = new ImageView("/com/iha/emulator/resources/images/sensor_types/" + s.getFile());
                            setGraphic(image);
                            setText(String.valueOf(s.getName()));
                        } else {
                            setText(null);
                        }
                    }
                };
            }
        });
        view.getSensorIconComboBox().setButtonCell(new ListCell<SensorIcon>(){
            @Override
            protected void updateItem(SensorIcon s,boolean bln){
                super.updateItem(s,bln);
                if( s != null ){
                    ImageView image = new ImageView("/com/iha/emulator/resources/images/sensor_types/" + s.getFile());
                    image.setFitWidth(22);
                    image.setFitHeight(22);
                    setGraphic(image);
                }else{
                    setText(null);
                }
            }
        });
        //validation support bind with save button
        sensorGeneralValidator.validationResultProperty().addListener((observable, oldValue, newValue) -> {
            setSensorInfoSet(!sensorGeneralValidator.isInvalid());
        });
        //populate value tree
        if(view.getValuesTree().getRoot() == null){
            view.getValuesTree().setRoot(new TreeItem<Value>(new EmptyValue("Values")));
            view.getValuesTree().getRoot().setExpanded(true);
            view.getValuesTree().setShowRoot(false);
        }
        view.getValuesTree().setCellFactory(new Callback<TreeView<Value>, TreeCell<Value>>() {
            @Override
            public TreeCell call(TreeView<Value> param) {
                TreeCell<Value> treeItem = new TreeCell<Value>() {
                    @Override
                    protected void updateItem(Value v, boolean bln) {
                        super.updateItem(v, bln);
                        if (v != null) {
                            setText(v.getName());
                        } else {
                            setText(null);
                        }
                    }
                };

                return treeItem;
            }
        });
        view.getValuesTree().getSelectionModel().selectedItemProperty().addListener((observable, oldValue, newValue) -> {
            if (newValue != null && newValue instanceof TreeItem) {
                prepareValueInfoContainer((Value) ((TreeItem) newValue).getValue());
            }
        });
        if(values != null){
            values.forEach(this::addValueToTree);
        }else{
            logger.error("Values not created");
        }
    }

    private void updateTree(){
        TreeItem newItem = new TreeItem();
        view.getValuesTree().getRoot().getChildren().add(newItem);
        view.getValuesTree().getRoot().getChildren().remove(newItem);
    }

    private ObservableList<SensorIcon> getSensorIcons(){
        return FXCollections.observableArrayList(SensorIcon.values());
    }

    public boolean getSensorInfoSet() {
        return sensorInfoSet.get();
    }

    public BooleanProperty sensorInfoSetProperty() {
        return sensorInfoSet;
    }

    public void setSensorInfoSet(boolean sensorInfoSet) {
        this.sensorInfoSet.set(sensorInfoSet);
    }

    public boolean getValueInfoSet() {
        return valueInfoSet.get();
    }

    public BooleanProperty valueInfoSetProperty() {
        return valueInfoSet;
    }

    public void setValueInfoSet(boolean valueInfoSet) {
        this.valueInfoSet.set(valueInfoSet);
    }

    @Override
    public void addModel(Object model) {

    }

    @Override
    public Object getModel() {
        return null;
    }

    @Override
    public Node getView() {
        return view.getView();
    }

    @Override
    public void clear() {

    }

    @SuppressWarnings("unchecked")
    @Override
    public void bind() {
        view.setPresenter(this);
        //value boolean combo box
        view.getValueComboBox().setItems(FXCollections.observableArrayList("ON","OFF"));
        values = new SimpleListProperty<>(sensorController.getModel().getValues());
        //normal distribution
        view.getNormalDistributionContainer().setVisible(false);
        view.getNormalDistributionContainer().visibleProperty().bind(new BooleanBinding() {
            {
                bind(view.getGeneratorTypeComboBox().getSelectionModel().selectedItemProperty());
            }
            @Override
            protected boolean computeValue() {
                if(view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem() == null) return false;
                return view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem().equals(Generator.NORMAL_DISTRIBUTION);
            }
        });
        view.getLinearDistributionContainer().setVisible(false);
        view.getLinearDistributionContainer().visibleProperty().bind(new BooleanBinding() {
            {
                bind(view.getGeneratorTypeComboBox().getSelectionModel().selectedItemProperty());
            }
            @Override
            protected boolean computeValue() {
                if(view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem() == null) return false;
                return view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem().equals(Generator.LINEAR_DISTRIBUTION);
            }
        });
        view.getBooleanRandomContainer().setVisible(false);
        view.getBooleanRandomContainer().visibleProperty().bind(new BooleanBinding() {
            {
                bind(view.getGeneratorTypeComboBox().getSelectionModel().selectedItemProperty());
            }
            @Override
            protected boolean computeValue() {
                if(view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem() == null) return false;
                return view.getGeneratorTypeComboBox().getSelectionModel().getSelectedItem().equals(Generator.BOOLEAN_RANDOM);
            }
        });
        view.getBooleanRandomProbabilityLbl().textProperty().bind(new StringBinding() {
            {
                bind(view.getBooleanRandomProbabilitySlider().valueProperty());
            }
            @Override
            protected String computeValue() {
                return signalBatterySliderFormatter.format(view.getBooleanRandomProbabilitySlider().getValue()) + " %";
            }
        });
        //generators
        view.getGeneratorsContainer().visibleProperty().bind(view.getValueYesGenerateValueRadBtn().selectedProperty());
        view.getGeneratorTypeLbl().disableProperty().bind(view.getValueNoGenerateValueRadBtn().selectedProperty());
        view.getGeneratorTypeComboBox().disableProperty().bind(view.getValueNoGenerateValueRadBtn().selectedProperty());
        //general information
        sensorGeneralValidator.registerValidator(view.getSensorNameLbl(), false, Validator.createEmptyValidator("Name is required"));
        sensorGeneralValidator.registerValidator(view.getSensorIdLbl(), false, Validator.createEmptyValidator("Id is required"));
        sensorGeneralValidator.registerValidator(view.getSensorIdLbl(), false, (Control c, String newValue) ->
                ValidationResult.fromErrorIf(view.getSensorIdLbl(), "Id must be in IP4 address format (xxx.xxx.xxx.xxx)", !Utilities.isIp(newValue)));
        sensorGeneralValidator.registerValidator(view.getSensorIconComboBox(), false, (Control c, SensorIcon icon) ->
                ValidationResult.fromErrorIf(view.getSensorIconComboBox(), "Icon is required", (icon == null)));
        // --sliders
        // -- -- battery slider
        view.getSensorBatteryValueLbl().textProperty().bind(new StringBinding() {
            {
                bind(view.getSensorBatterySlider().valueProperty());
            }
            @Override
            protected String computeValue() {
                return signalBatterySliderFormatter.format(view.getSensorBatterySlider().getValue()) + " %";
            }
        });
        // -- -- signal slider
        view.getSensorSignalValueLbl().textProperty().bind(new StringBinding() {
            {
                bind(view.getSensorSignalSlider().valueProperty());
            }
            @Override
            protected String computeValue() {
                return signalBatterySliderFormatter.format(view.getSensorSignalSlider().getValue()) + " %";
            }
        });
        // -- -- refresh slider
        view.getSensorRefreshSlider().setMax(REFRESH_SLIDER_VALUE_COUNT);
        view.getSensorRefreshValueLbl().textProperty().bind(new StringBinding() {
            {
                bind(view.getSensorRefreshSlider().valueProperty());
            }
            @Override
            protected String computeValue() {
                return Utilities.formatSeconds(Utilities.refreshSliderScaleToSeconds(view.getSensorRefreshSlider().getValue()));
            }
        });
        // -- color picker
        addCustomColorsToColorPicker(view.getSensorColorPicker());
        // -- sensor header sample
        view.getSensorHeaderSampleLbl().textProperty().bind(view.getSensorNameLbl().textProperty());
        view.getSensorIconComboBox().valueProperty().addListener((observable, oldValue, newValue) ->
                view.getSensorHeaderSampleLbl().setGraphic(
                    new ImageView(
                            new Image("/com/iha/emulator/resources/images/sensor_types/" + ((SensorIcon)newValue).getFile())
                    )
                ));
        view.getSensorColorPicker().valueProperty().addListener(new ChangeListener<Color>() {
            @Override
            public void changed(ObservableValue<? extends Color> observable, Color oldValue, Color newValue) {
                if(view.getSensorColorPicker().getValue() != null)
                    view.getSensorHeaderSampleLbl().setStyle("-fx-background-color: " + Utilities.toRGBCode(newValue) + ";");
            }
        });
        view.getSensorColorPicker().setValue(view.getSensorColorPicker().getCustomColors().get(0));
        // VALUES
        // -- values count bound to visibility of values information panel
        view.getValuesPanelContainer().visibleProperty().bind(new BooleanBinding() {
            {
                bind(values.sizeProperty());
            }
            @Override
            protected boolean computeValue() {
                return (values.size() > 0);
            }
        });
        view.getNoValueSelectedLbl().visibleProperty().bind(new BooleanBinding() {
            {
                bind(values.sizeProperty());
            }
            @Override
            protected boolean computeValue() {
                return !(values.size() > 0);
            }
        });
        // -- values tree selection action


        view.getSaveValueBtn().visibleProperty().bind(new BooleanBinding() {
            {
                bind(valueInfoSet);
            }

            @Override
            protected boolean computeValue() {
                return !valueInfoSet.get();
            }
        });
        view.getValuesTree().disableProperty().bind(new BooleanBinding() {
            {
                bind(valueInfoSet);
            }
            @Override
            protected boolean computeValue() {
                return !getValueInfoSet();

            }
        });

        view.getSensorIdLbl().setPromptText("Example: 100.100.100.100");
        view.getSensorNameLbl().setPromptText("Example: Multisensor");
        listenToValueChanges();
    }

    private void addCustomColorsToColorPicker(ColorPicker picker){
        // clear default picker colors
        picker.getCustomColors().clear();
        for(String color : DEFAULT_COLORS){
            picker.getCustomColors().add(Color.web(color));
        }

    }
}
