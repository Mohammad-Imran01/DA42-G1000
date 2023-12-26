// PFDWindow.cpp
#include "pfdwindow.h"
#include "ui_pfdwindow.h"

PFDWindow::PFDWindow(DataController* dataController_, QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::PFDWindow)
    , pfdMid(new QQuickWidget)
    , mainLayout(new QVBoxLayout)
    , dataController(dataController_)
    , pfdSoftkeyLayout(new PFDSoftKey(dataController))
    , pfdRootItem(pfdMid->rootObject())
{
    ui->setupUi(this);

    pfdMid->setObjectName("pfdMidWidget");
    pfdMid->setSource(QUrl("qrc:/custom/qml/PFD/WindowPFD.qml"));

    setupUI();
    connectUI();
}

PFDWindow::~PFDWindow()
{
    delete ui;
}

void PFDWindow::setupUI()
{
    mainLayout->addWidget(pfdMid);
    mainLayout->addLayout(pfdSoftkeyLayout->getWidget());
    mainLayout->setSpacing(0);
    mainLayout->setContentsMargins(0, 0, 0, 0);
    pfdMid->setContentsMargins(0,0,0,0);
    ui->centralwidget->setLayout(mainLayout);
    mainLayout->setAlignment(Qt::AlignHCenter);
}

void PFDWindow::connectUI()
{
    connect(dataController, &DataController::dataRecievedChanged, this, &PFDWindow::handleSimData);
}

void PFDWindow::handleSimData()
{
    try {
        pfdRootItem->setProperty("varPitchValue", -1 * StationaryPFD_St.pitch_64);
        pfdRootItem->setProperty("varYawValue", StationaryPFD_St.yaw_64);
        pfdRootItem->setProperty("varRollValue", StationaryPFD_St.roll_64);

        pfdRootItem->setProperty("varAltitudeValue", StationaryPFD_St.varIndicatedAltitude);
        pfdRootItem->setProperty("varAirspeedValue", StationaryPFD_St.varIndicatedAirSpeed);
        pfdRootItem->setProperty("varVSIValue", StationaryPFD_St.varVerticalSpeed);

        pfdRootItem->setProperty("varVSIValueY",clamp(
                                     StationaryPFD_St.varVerticalSpeed, -4000, 4000));
    } catch (const std::exception &e) {
        qDebug() << "Exception caught: " << e.what();
    } catch (...) {
        qDebug() << "Unknown exception caught.";
    }
}

