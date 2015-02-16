package com.iha.emulator.ui.dialogs.sensor;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.net.URL;
import java.util.ResourceBundle;

/**
 * Created by Shu on 10.12.2014.
 */
public class AddNewSensorDialogView implements Initializable,AddNewSensorDialogPresenter.Display{

    private static final Logger logger = LogManager.getLogger(AddNewSensorDialogView.class);

    private AddNewSensorDialogPresenter presenter;

    @FXML private Node view;
    @FXML private Button loadTemplateBtn;
    @FXML private Button saveTemplateBtn;
    @FXML private Button addBtn;
    @FXML private Button cancelBtn;
    //general info
    @FXML private TextField sensorIdLbl;
    @FXML private TextField sensorNameLbl;
    @FXML private ComboBox sensorIconComboBox;
    @FXML private ColorPicker sensorColorPicker;
    @FXML private Slider sensorBatterySlider;
    @FXML private Slider sensorSignalSlider;
    @FXML private Slider sensorRefreshSlider;
    @FXML private Label sensorBatteryValueLbl;
    @FXML private Label sensorSignalValueLbl;
    @FXML private Label sensorRefreshValueLbl;
    @FXML private Label sensorHeaderSampleLbl;
    //database
    @FXML private MenuItem checkIdMenuItem;
    //values general
    @FXML private Button addValueBtn;
    @FXML private Button deleteValueBtn;
    @FXML private TreeView valuesTree;
    @FXML private VBox valuesPanelContainer;
    @FXML private Label noValueSelectedLbl;
    //value info
    @FXML private TextField valueTypeTextField;
    @FXML private TextField valueNameTextField;
    @FXML private TextField valueTextField;
    @FXML private ToggleGroup storeValueRadBtnGroup;
    @FXML private RadioButton valueYesStoreHistoryRadBtn;
    @FXML private RadioButton valueNoStoreHistoryRadBtn;
    @FXML private RadioButton valueYesGenerateValueRadBtn;
    @FXML private RadioButton valueNoGenerateValueRadBtn;
    // generator panels
    @FXML private StackPane generatorsContainer;
    @FXML private Label generatorTypeLbl;
    // -- normal distribution
    @FXML private RadioButton normalDistributionRadBtn;
    @FXML private GridPane normalDistributionContainer;
    @FXML private TextField minNormalTextField;
    @FXML private TextField maxNormalTextField;
    @FXML private TextField devNormalTextField;
    @FXML private TextField avgNormalTextField;
    // -- linear distribution
    @FXML private RadioButton linearDistributionRadBtn;
    @FXML private GridPane linearDistributionContainer;
    @FXML private TextField minLinearTextField;
    @FXML private TextField maxLinearTextField;
    @FXML private TextField stepLinearTextField;
    // -- save button
    @FXML private Button saveValueBtn;

    public AddNewSensorDialogView() {

    }

    @FXML
    public void handleLoadTemplate(){
        logger.trace("Load template clicked");
        presenter.loadTemplate();
    }

    @FXML
    public void handleSaveTemplate(){
        logger.trace("Save template clicked");
        presenter.saveTemplate();
    }

    @FXML
    public void handleCheckId(){
        logger.trace("Check Id clicked");
        presenter.checkId();
    }

    @FXML
    public void handleAdd(){
        logger.trace("Add button clicked");
        presenter.add();
    }

    @FXML
    public void handleCancel(){
        logger.trace("Cancel button clicked");
        presenter.cancel();
    }

    @FXML
     public void handleAddValue(){
        logger.trace("Add value button clicked");
        presenter.addValue();
    }

    @FXML
    public void handleDeleteValue(){
        logger.trace("Delete value button clicked");
        presenter.deleteValue();
    }

    @Override
    public TextField getSensorIdLbl() {
        return sensorIdLbl;
    }

    @Override
    public TextField getSensorNameLbl() {
        return sensorNameLbl;
    }

    @Override
    public ComboBox getSensorIconComboBox() {
        return sensorIconComboBox;
    }

    @Override
    public ColorPicker getSensorColorPicker() {
        return sensorColorPicker;
    }

    @Override
    public Slider getSensorBatterySlider() {
        return sensorBatterySlider;
    }
    @Override
    public Slider getSensorSignalSlider() {
        return sensorSignalSlider;
    }
    @Override
    public Slider getSensorRefreshSlider() {
        return sensorRefreshSlider;
    }
    @Override
    public Label getSensorBatteryValueLbl() {
        return sensorBatteryValueLbl;
    }
    @Override
    public Label getSensorSignalValueLbl() {
        return sensorSignalValueLbl;
    }
    @Override
    public Label getSensorRefreshValueLbl() {
        return sensorRefreshValueLbl;
    }

    @Override
    public Label getSensorHeaderSampleLbl() {
        return sensorHeaderSampleLbl;
    }

    @Override
    public MenuItem getCheckIdMenuItem() {
        return checkIdMenuItem;
    }

    @Override
    public TreeView getValuesTree() {
        return valuesTree;
    }

    @Override
    public VBox getValuesPanelContainer() {
        return valuesPanelContainer;
    }

    @Override
    public Label getNoValueSelectedLbl() {
        return noValueSelectedLbl;
    }

    @Override
    public TextField getValueTypeTextField() {
        return valueTypeTextField;
    }

    @Override
    public TextField getValueNameTextField() {
        return valueNameTextField;
    }

    @Override
    public TextField getValueTextField() {
        return valueTextField;
    }

    @Override
    public RadioButton getValueYesStoreHistoryRadBtn() {
        return valueYesStoreHistoryRadBtn;
    }

    @Override
    public RadioButton getValueNoStoreHistoryRadBtn() {
        return valueNoStoreHistoryRadBtn;
    }

    @Override
    public RadioButton getValueYesGenerateValueRadBtn() {
        return valueYesGenerateValueRadBtn;
    }

    @Override
    public RadioButton getValueNoGenerateValueRadBtn() {
        return valueNoGenerateValueRadBtn;
    }

    @Override
    public StackPane getGeneratorsContainer() {
        return generatorsContainer;
    }

    @Override
    public Label getGeneratorTypeLbl() {
        return generatorTypeLbl;
    }

    @Override
    public RadioButton getNormalDistributionRadBtn() {
        return normalDistributionRadBtn;
    }

    @Override
    public GridPane getNormalDistributionContainer() {
        return normalDistributionContainer;
    }

    @Override
    public TextField getMinNormalTextField() {
        return minNormalTextField;
    }

    @Override
    public TextField getMaxNormalTextField() {
        return maxNormalTextField;
    }

    @Override
    public TextField getDevNormalTextField() {
        return devNormalTextField;
    }

    @Override
    public TextField getAvgNormalTextField() {
        return avgNormalTextField;
    }

    @Override
    public RadioButton getLinearDistributionRadBtn() {
        return linearDistributionRadBtn;
    }

    @Override
    public GridPane getLinearDistributionContainer() {
        return linearDistributionContainer;
    }

    @Override
    public TextField getMinLinearTextField() {
        return minLinearTextField;
    }

    @Override
    public TextField getMaxLinearTextField() {
        return maxLinearTextField;
    }

    @Override
    public TextField getStepLinearTextField() {
        return stepLinearTextField;
    }

    @Override
    public Button getSaveValueBtn() {
        return saveValueBtn;
    }

    @Override
    public Node getView() {
        return view;
    }

    @Override
    public void setPresenter(AddNewSensorDialogPresenter presenter) {
        this.presenter = presenter;
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }
}
