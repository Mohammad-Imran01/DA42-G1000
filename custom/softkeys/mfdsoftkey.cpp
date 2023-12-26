#include "mfdsoftkey.h"
#include <QKeyEvent>
MfdSoftKey::MfdSoftKey(DataController* dataController_, QObject* parent)
    : QObject(parent), dataController(dataController_)
{
    setupButtons();

    connect(this, &MfdSoftKey::buttonPressed, this, &MfdSoftKey::handleButtonPressed);
    connect(this, &MfdSoftKey::buttonReleased, this, &MfdSoftKey::handleButtonReleased);
    connect(this, &MfdSoftKey::btnLayerChanged, this, &MfdSoftKey::updateButton);
}

void MfdSoftKey::setupButtons()
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

void MfdSoftKey::updateButton()
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
        qDebug() << "Unable to update MFD SoftKeys.";
    }
}

void MfdSoftKey::handleButtonPressed(int btnIdx)
{
    QPushButton *button = qobject_cast<QPushButton*>(btnLayoutBox->itemAt(btnIdx)->widget());
    button->setStyleSheet(btnActiveStyleSheet);
    button->update();

    // qDebug() << "Handling KeyPress MFD: !" << m_btnLayer << " " << btnIdx;
    switch(btnIdx) {
    case 0:
        if(btnEnablePressed[m_btnLayer][0]){
            switch(m_btnLayer) {
            case 0: {
                dataController->setModeEIS(1);
                setBtnLayer(1);
            }break;
            case 1: {
                dataController->setModeEIS(1);
            }break;
            case 2: {
                dataController->setModeEIS(1);
            }break;
            case 3: {
                // setTrafficVisible(!varTrafficVisible);
            }break;
            case 4: {
                dataController->setModeEIS(1);
            } break;
            }
        }
        break;
    case 1:
        if(btnEnablePressed[m_btnLayer][1]) {
            dataController->setModeEIS(2);
        }
        break;
    case 2:
        if(btnEnablePressed[m_btnLayer][2]) {
            switch(m_btnLayer) {
            case 0: {
                setBtnLayer(3);
            } break;
            case 1: {
                dataController->setModeEIS(3);
                setBtnLayer(2);
            } break;
            case 2: {
                dataController->setModeEIS(3);
            } break;
            case 3:{
                emit mapThemeChanged();
            } break;
            }
        }
        break;
    case 3:
        if(btnEnablePressed[m_btnLayer][3]) {
            varTerrainVisible = !varTerrainVisible;
            emit modeTerrainChanged(varTerrainVisible);
        }
        break;
    case 4:
        if(btnEnablePressed[m_btnLayer][4]) {
            switch(m_btnLayer) {
            case 2: {
                // --varFuelChanger;
            } break;
            case 3: {
                modeAirwaysVisible = (modeAirwaysVisible + 1) % (constMaxModeAirWays + 1);
                emit modeAirwaysVisibleChanged(modeAirwaysVisible);

            } break;
            }
        }
        break;
    case 5:
        if(btnEnablePressed[m_btnLayer][5]) {
            switch(m_btnLayer) {
            case 2: {
                // ++varFuelChanger;
            } break;
            case 3: {
                // varSTRMSCPVisible = !varSTRMSCPVisible
                // setVarSTRMSCPVisible(!getVarSTRMSCPVisible());
            }break;
            }
        }
        break;
    case 6:
        if(btnEnablePressed[m_btnLayer][6]) {
            switch(m_btnLayer) {
            case 2: {
                // varResetFuel = !varResetFuel
            } break;
            case 3: {
                // varNEXRADVisible = !varNEXRADVisible
                // setVarNEXRADVisible(!getVarNEXRADVisible());
            } break;
            }
        }
        break;
    case 7:
        if(btnEnablePressed[m_btnLayer][7]) {
            // varXM_LTNGVisible = !varXM_LTNGVisible
            // setVarXM_LTNGVisible(!getVarXM_LTNGVisible());
        }
        break;
    case 8:
        if(btnEnablePressed[m_btnLayer][8]) {

        }
        break;
    case 9:
        if(btnEnablePressed[m_btnLayer][9]) {
            emit modeDCLRTChanged(varModeDCLRT = (varModeDCLRT % constMaxModeDCLRT) + 1 ?: constMaxModeDCLRT);
        }
        break;
    case 10: //11 '-'
        if(btnEnablePressed[m_btnLayer][10]) {
            switch(m_btnLayer) {
            case 0: {
                // varChartVisible = !varChartVisible
                // setVarChartVisible(!getVarChartVisible());
            } break;
            case 1: {
                setBtnLayer(0);
            } break;
            case 2: {
                setBtnLayer(1);
            } break;
            case 3: {
                setBtnLayer(0);
            } break;
            case 4: {
                setBtnLayer(0);
                btnTexts[4][5] = "DONE";
                // varEmergencyStart = false
                // setVarEmergencyStart(false);
            } break;
            }
        }
        break;
    case 11: //12 '+'
        if(btnEnablePressed[m_btnLayer][11]){
            if(m_btnLayer == 0) {
                btnTexts[4][5] = "UNDO";
                setBtnLayer(4);
                // varCheckListVisible = !varCheckListVisible
                // setVarCheckListVisible(!getVarCheckListVisible());
            } else {
                // varEmergencyStart = !varEmergencyStart
                // setVarEmergencyStart(!getVarEmergencyStart());
            }
        }
        break;
    }
}
void MfdSoftKey::handleButtonReleased(int btnIdx)
{
    QPushButton *button = qobject_cast<QPushButton*>(btnLayoutBox->itemAt(btnIdx)->widget());
    button->setStyleSheet(btnStyleSheet);
    button->update();

    // qDebug() << "Handle release: " << m_btnLayer << " " << btnIdx;
}



int MfdSoftKey::btnLayer() const
{
    return m_btnLayer;
}
void MfdSoftKey::setBtnLayer(int newBtnLayer)
{
    if (m_btnLayer == newBtnLayer)
        return;
    qDebug() << "BTNlAYER: " << newBtnLayer;
    m_btnLayer = newBtnLayer;
    emit btnLayerChanged();
}

// int MfdSoftKey::modeEIS() const
// {
//     return m_modeEIS;
// }
// void MfdSoftKey::dataController->setModeEIS(int newModeEIS)
// {
//     if (m_modeEIS == newModeEIS)
//         return;
//     m_modeEIS = newModeEIS;
//     emit modeEISChanged();
// }
