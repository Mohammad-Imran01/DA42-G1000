#include "mfdwindow.h"
#include "ui_mfdwindow.h"
#include "../../src/gui/mainwindow.h"
#include "ui_mainwindow.h"

MFDWindow::MFDWindow(MainWindow* mainWindow_, DataController* dataController_, QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MFDWindow)
    , mainUi(NavApp::getMainUi())
    , mainWindow(mainWindow_)
    , dataController(dataController_)
    , mapWidget(mainWindow_ ? mainWindow_->getMapWidget() : nullptr)
    , mapthemeHandler(mainWindow_ ? mainWindow_->getMapThemeHandler() : nullptr)
    , mapDetailHandler(NavApp::getMapDetailHandler())
    , mapThemeActionGroup(mapthemeHandler ? mapthemeHandler->getActionGroupMapTheme() : nullptr)
    , navcom(new NAVCOM)
    , eis(new WidgetEIS)
    , mfdsoftKey(new MfdSoftKey(dataController))
    , eisWidget(eis ? eis->getWidget() : nullptr)
    , eisRootItem(eisWidget ? eisWidget->rootObject() : nullptr)
    , mainLayout(new QVBoxLayout)
    , midLayout(new QHBoxLayout)
{
    if (!mainUi) {
        qFatal("Main window UI is nullptr!");
    }

    if (!mapthemeHandler) {
        qFatal("Map theme handler is nullptr!");
    }

    if (mainUi && mapthemeHandler) {
        ui->setupUi(this);
        setupUI();
        connectUI();
    }
}

MFDWindow::~MFDWindow()
{
    // delete mapWidget;
    delete mfdsoftKey;
    delete ui;
}

void MFDWindow::setupUI()
{

    midLayout->addWidget(eis->getWidget());
    midLayout->addWidget(mainWindow->getMapWidget());

    mainLayout->addWidget(navcom->getWidget());
    mainLayout->addLayout(midLayout);
    mainLayout->addLayout(mfdsoftKey->getWidget());

    mainLayout->setSpacing(0);
    mainLayout->setContentsMargins(0, 0, 0, 0);
    midLayout->setSpacing(0);
    midLayout->setContentsMargins(0, 0, 0, 0);

    ui->centralwidget->setLayout(mainLayout);
}

void MFDWindow::connectUI()
{
    connect(dataController, &DataController::modeEISChanged, this, &MFDWindow::handleEISMode);
    connect(dataController, &DataController::dataRecievedChanged, this, &MFDWindow::handleSimData);
    connect(mfdsoftKey, &MfdSoftKey::mapThemeChanged, this, &MFDWindow::handleMapTheme);
    connect(mfdsoftKey, &MfdSoftKey::modeDCLRTChanged, this, &MFDWindow::handleDCLRTmode);

    connect(mfdsoftKey, &MfdSoftKey::modeTerrainChanged, this, &MFDWindow::handleTerrainVisible);
    connect(mfdsoftKey, &MfdSoftKey::modeAirwaysVisibleChanged, this, &MFDWindow::handleAirwaysMode);
    // connect(mfdsoftKey, &MfdSoftKey::, this, &MFDWindow::);
}

void MFDWindow::handleSimData()
{
    try {
        eisRootItem->setProperty("varEngineLoad1", StationaryPFD_St.varEngineLoad1);
        eisRootItem->setProperty("varEngineLoad2", StationaryPFD_St.varEngineLoad2);

        eisRootItem->setProperty("varRPM1", StationaryPFD_St.varRPM1);
        eisRootItem->setProperty("varRPM2", StationaryPFD_St.varRPM2);

        eisRootItem->setProperty("varFuelFlowVal1", toFixed(StationaryPFD_St.varFuelFlowVal1, 1));
        eisRootItem->setProperty("varFuelFlowVal2", toFixed(StationaryPFD_St.varFuelFlowVal2, 1));

        eisRootItem->setProperty("varOilTempVal1", toFixed(StationaryPFD_St.varOilTempVal1, 0));
        eisRootItem->setProperty("varOilTempVal2", toFixed(StationaryPFD_St.varOilTempVal2, 0));

        eisRootItem->setProperty("varOilPressVal1", toFixed(StationaryPFD_St.varOilPresVal1, 0));
        eisRootItem->setProperty("varOilPressVal2", toFixed(StationaryPFD_St.varOilPresVal2, 0));

        eisRootItem->setProperty("varCoolantTempVal1", toFixed(StationaryPFD_St.varCoolantTempVal1, 0));
        eisRootItem->setProperty("varCoolantTempVal2", toFixed(StationaryPFD_St.varCoolantTempVal2, 0));

        eisRootItem->setProperty("varGearBVal1", toFixed(StationaryPFD_St.varCoolantTempVal1, 0));
        eisRootItem->setProperty("varGearBVal2", toFixed(StationaryPFD_St.varCoolantTempVal2, 0));

        eisRootItem->setProperty("varFuelTempVal1", toFixed(StationaryPFD_St.varOilTempVal1 , 0));
        eisRootItem->setProperty("varFuelTempVal2", toFixed(StationaryPFD_St.varOilTempVal1, 0));

        eisRootItem->setProperty("varFuelQtyVal1", toFixed(StationaryPFD_St.varFuelQtyVal1, 0));
        eisRootItem->setProperty("varFuelQtyVal2", toFixed(StationaryPFD_St.varFuelQtyVal2, 0));

        double volts = StationaryPFD_St.varVolts;
        eisRootItem->setProperty("varVoltVal1", volts);
        eisRootItem->setProperty("varVoltVal2", volts);

        double loadAmps = StationaryPFD_St.varLoadAmps;
        eisRootItem->setProperty("varAmpVal1", loadAmps);
        eisRootItem->setProperty("varAmpVal2", loadAmps);
    } catch (const std::exception &e) {
        qDebug() << "Unable to update EIS DATA. Exception caught: " << e.what();
    } catch (...) {
        qDebug() << "Unable to update EIS DATA. Unknown exception caught.";
    }
}

void MFDWindow::handleEISMode(int mode)
{
    if (eisWidget && eisRootItem) {
        // Uncomment the following line if you want to use QMetaObject::invokeMethod
        // QMetaObject::invokeMethod(eisRootItem, "updateModeEIS", Q_ARG(int, newVal));

        // Set the "modeEIS" property directly
        eisRootItem->setProperty("modeEIS", mode);
    } else {
        qDebug() << "Error MFDWindow: eisRootItem is nullptr";
    }
}

void MFDWindow::handleMapTheme() {
    int currentActiveIdx = getMarkedIndex(mapThemeActionGroup);
    unCheckQAction(mapThemeActionGroup);
    if(currentActiveIdx == 0) {
        markIndex(mapThemeActionGroup, 9);
    } else {
        markIndex(mapThemeActionGroup, 0);
    }
    mapthemeHandler->changeMapTheme();
    qDebug() << "Theme updated!!!";
}

void MFDWindow::handleTerrainVisible(bool isVisible) {
    mapWidget->toggleTerrain(isVisible);
    // mapWidget->useMapUpdate();
    mainWindow->useUpdateMapObjectsShown();
}

void MFDWindow::handleAirwaysMode(int newMode) {
    if(newMode == 0) {
        mainUi->actionMapShowVictorAirways->setChecked(false);
        mainUi->actionMapShowJetAirways->setChecked(false);
    } else if (newMode == 1) {
        mainUi->actionMapShowVictorAirways->setChecked(true);
        mainUi->actionMapShowJetAirways->setChecked(false);
    } else if (newMode == 2) {
        mainUi->actionMapShowVictorAirways->setChecked(false);
        mainUi->actionMapShowJetAirways->setChecked(true);
    } else if (newMode == 3) {
        mainUi->actionMapShowVictorAirways->setChecked(true);
        mainUi->actionMapShowJetAirways->setChecked(true);
    }
    qDebug() <<Q_FUNC_INFO << "Mode airways: " << newMode;
    mainWindow->useUpdateMapObjectsShown();
}


void MFDWindow::handleDCLRTmode(int newDCLTR) {
    switch (newDCLTR) {
    case 1: {
        mapDetailHandler->setDetailLevel(8);

        mainUi->actionMapShowCities->setChecked(true);
        mainUi->actionShowAirspaces->setChecked(false);
        mainUi->actionMapShowAirports->setChecked(false);
        mainUi->actionMapShowGrid->setChecked(false);
    } break;
    case 2:{
        mapDetailHandler->setDetailLevel(10);

        mainUi->actionMapShowCities->setChecked(true);
        mainUi->actionShowAirspaces->setChecked(true);
        mainUi->actionMapShowAirports->setChecked(false);
        mainUi->actionMapShowGrid->setChecked(true);
    }break;
    case 3:{
        mapDetailHandler->setDetailLevel(15);

        mainUi->actionMapShowCities->setChecked(true);
        mainUi->actionShowAirspaces->setChecked(true);
        mainUi->actionMapShowAirports->setChecked(true);
        mainUi->actionMapShowGrid->setChecked(true);
    }break;
    }
    mainWindow->useUpdateMapObjectsShown();
}
