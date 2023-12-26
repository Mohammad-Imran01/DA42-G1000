#include "pfdsoftkey.h"
#include <QDebug>
PFDSoftKey::PFDSoftKey(DataController* dataController_,QObject *parent)
    : QObject(parent), dataController(dataController_)
{

    setupButtons();
    connect(this, &PFDSoftKey::buttonPressed, this, &PFDSoftKey::handleButtonPressed);
    connect(this, &PFDSoftKey::buttonReleased, this, &PFDSoftKey::handleButtonReleased);

    connect(this, &PFDSoftKey::btnLayerChanged, this, &PFDSoftKey::updateButton);
}


void PFDSoftKey::setupButtons()
{
    btnLayoutBox = new QHBoxLayout;
    btnLayoutBox->setContentsMargins(0, 0, 0, 0);
    btnLayoutBox->setSpacing(2);

    for (int i = 0; i < 12; ++i) {
        buttons[i] = new QPushButton(QString::fromStdString(btnTexts[m_btnLayer][i]));

        buttons[i]->setEnabled(btnEnablePressed[m_btnLayer][i]);
        buttons[i]->setStyleSheet(btnStyleSheet);

        connect(buttons[i], &QPushButton::pressed, [this, i]() {emit buttonPressed(i);});
        connect(buttons[i], &QPushButton::released, [this, i]() {emit buttonReleased(i);});

        buttons[i]->setFixedWidth((1024 - 11) / 12);

        btnLayoutBox->addWidget(buttons[i]);
    }
}
void PFDSoftKey::updateButton()
{
    if (btnLayoutBox) {
        for (int i = 0; i < 12; ++i) {
            QPushButton *button = qobject_cast<QPushButton*>(btnLayoutBox->itemAt(i)->widget());
            if (button) {
                button->setEnabled(btnEnablePressed[m_btnLayer][i]);
                button->setText(QString::fromStdString(btnTexts[m_btnLayer][i]));
                button->update();
            }
        }
        qDebug() << "Button Updated!";
    } else {
        qDebug() << "Unable to update pfd SoftKeys.";
    }
}

void PFDSoftKey::handleButtonPressed(int btnIdx)
{
    // qDebug() << "Handling KeyPress!";

    QPushButton *button = qobject_cast<QPushButton*>(btnLayoutBox->itemAt(btnIdx)->widget());
    button->setStyleSheet(btnActiveStyleSheet);
    button->update();


    switch(btnIdx) {
    case 0:
        if(btnEnablePressed[m_btnLayer][0]){
            switch(m_btnLayer) {
            case 1: {
                // btnWindowINSET.visible = false
            } break;
            case 2:{
                // m_btnLayer = 3
                setBtnLayer(3);
            } break;
            case 3: {
                // pathway- ver n hor path of plane
            } break;
            case 8: {
                // 0 enter
            } break;
            }
        }
        break;
    case 1:
        if(btnEnablePressed[m_btnLayer][1]) {
            switch(m_btnLayer) {
            case 0: {
                // btnWindowINSET.visible = true
                    // m_btnLayer = 1
                setBtnLayer(1);
            } break;
            case 1: {
                // ++modeDCLTR// = (modeDCLTR == maxModeDCLTR) ? 0:modeDCLTR+1
                      // modeDCLTR %= maxModeDCLTR
            } break;
            case 2: {
                // setDefault = !setDefault
            } break;
            case 3:{
            // syn terr
            } break;
        case 8: {
            // 1 enter
        } break;
            }
        }
        break;
    case 2:
        if(btnEnablePressed[m_btnLayer][2]) {
        switch(m_btnLayer) {
        case 2: {
            //                        configure wind data
        } break;
        case 3: {
            //                      HRZN HDG
        } break;
        case 4: {
            //                      OPTN1
        } break;
        case 7:{
            //                        stby
        }
        break;
        case 8: {
            // 2
        } break;
        }
    }
    break;
    case 3:
        if(btnEnablePressed[m_btnLayer][3]) {
            switch(m_btnLayer) {
            case 0: { //pfd
                // m_btnLayer = 2
                setBtnLayer(2);
            } break;
            case 1: {
                // modeTraffic = modeTraffic == maxModeTraffic ? 0: modeTraffic+1
            } break;
            case 2:{
            } break; // DME optional
            case 3: {
                //                        apt signs
            } break;
            case 4: {
                // optn2
            }break;
            case 7: {
                //ON
            } break;
            case 8: {
                //3
            } break;
            }
        }
        break;
    case 4:
        if(btnEnablePressed[m_btnLayer][4]) {
            switch(m_btnLayer) {
            case 0: break; //obs
            case 1: {
                // insetTopoData = !insetTopoData
            }break;
            case 2: {
                // modeBearing1Info = modeBearing1Info == maxModeBearing1Info ? 0: modeBearing1Info+1
            } break;
            case 4: {
                //                        optn3
            } break;
            case 7: {
                //                    Selects Mode C – altitude reporting mode
            } break;
            case 8: {
                //                        4
            } break;
            }
        }
        break;
    case 5:
        if(btnEnablePressed[m_btnLayer][5]) {
            switch(m_btnLayer) {
            case 0:{ //CDI GPS-NAV1-NAV2
                // modeCDIInfo = modeCDIInfo == maxModeCDIInfo ? 0 : modeCDIInfo+1
            } break;
            case 1: {
                // insetTerrainData = !insetTerrainData
            } break;
            case 2: {
                // set HSI
            } break;
            case 4: {
                //                    off
            }break;
            case 5: {
                //                    360 HSI
            } break;
            case 6: {
                //                        METERS
            } break;
            case 7: {
                //GND
            } break;
            case 8:{
                //                        5
            }break;
            }
        }
        break;
    case 6:
        if(btnEnablePressed[m_btnLayer][6]) {
            switch(m_btnLayer) {
            case 0: break; //optio..
            case 2: {
                // modeBearing2Info = modeBearing2Info == maxModeBearing2Info ? 0: modeBearing2Info+1
            } break;
            case 5: {
                //                        ARC HSI
            } break;
            case 7: {
                //                    VFR
            } break;
            case 8: {
                //                        6
            } break;
            }
        }
        break;
    case 7:
        if(btnEnablePressed[m_btnLayer][7]) {
            switch(m_btnLayer) {
            case 0:{ //xpdr
                // btnWindowXPDR.visible = true
                    // m_btnLayer = 7
                setBtnLayer(7);
            } break;
            case 6: {
                //                    IN
            } break;
            case 7: {
                //                    CODE
            } break;
            case 8:{
                //                        7
            } break;

            }
        }
        break;
    case 8:
        if(btnEnablePressed[m_btnLayer][8]) {
            switch(m_btnLayer) {
            case 0:{
                // ident
            } break;
            case 2: {
                //                        ALT UNIT
            } break;

            case 6: {
                //                    HPA
            } break;
            case 7: {
                //                        IDENT
            } break;
            case 8: {
                //                        Ident
            } break;
            }
        }
        break;
    case 9:
        if(btnEnablePressed[m_btnLayer][9]) {
            switch(m_btnLayer) {
            case 0:{
                // showTimeRef = !showTimeRef
            } break;
            case 2: {
                //STD BARO Sets barometric pressure to 29.92 in Hg (1013 hPa if metric display is selected)
                // m_btnLayer = 0
                setBtnLayer(0);
            } break;
            case 8: {
                //                        BKSP
            } break;
            }
        }
        break;
    case 10: //11 '-'
        if(btnEnablePressed[m_btnLayer][10]){
            switch(m_btnLayer) {
            case 0: { // nrst
                // btnWindowNRST.visible = !btnWindowNRST.visible
            } break;
            case 1: {
                // m_btnLayer = 0
                setBtnLayer(0);
            } break;
            case 2: {
                // m_btnLayer = 0
                setBtnLayer(0);
            } break;
            case 3: {
                // m_btnLayer = 2
                setBtnLayer(2);
            } break;
            case 4: {
                // m_btnLayer = 2
                setBtnLayer(2);
            } break;
            case 5: {
                // m_btnLayer = 2
                setBtnLayer(2);
            } break;
            case 6: {
                // m_btnLayer = 2
                setBtnLayer(2);
            } break;
            case 7: {
                // m_btnLayer = 0
                setBtnLayer(0);
            } break;
            case 8: {
                // m_btnLayer = 7
                setBtnLayer(7);
            } break;
            }
        }
        break;
    case 11: {//12 '+'
        // showAlertWindow = !showAlertWindow
    }
    break;
    }
}
void PFDSoftKey::handleButtonReleased(int btnIdx)
{
    // qDebug() << "Handle release";
    QPushButton *button = qobject_cast<QPushButton*>(btnLayoutBox->itemAt(btnIdx)->widget());
    button->setStyleSheet(btnStyleSheet);
    button->update();
}

int PFDSoftKey::btnLayer() const
{
    return m_btnLayer;
}
void PFDSoftKey::setBtnLayer(int newBtnLayer)
{
    if (m_btnLayer == newBtnLayer)
        return;
    qDebug() << "BTNlAYER: " << newBtnLayer;

    m_btnLayer = newBtnLayer;
    emit btnLayerChanged();
}
