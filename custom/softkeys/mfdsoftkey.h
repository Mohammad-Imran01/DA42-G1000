#ifndef MFDSOFTKEY_H
#define MFDSOFTKEY_H


#include <QHBoxLayout>
#include <QPushButton>
#include <QDebug>
#include "../data/datacontroller.h"


class MfdSoftKey : public QObject
{
    Q_OBJECT
    // Q_PROPERTY(int modeEIS READ modeEIS WRITE setModeEIS NOTIFY modeEISChanged FINAL)
    Q_PROPERTY(int btnLayer READ btnLayer WRITE setBtnLayer NOTIFY btnLayerChanged FINAL)
public:
    explicit MfdSoftKey(DataController* dataController_, QObject *parent = nullptr);
    QHBoxLayout* getWidget() const {
        return btnLayoutBox;
    }
    int modeEIS() const;
    void setModeEIS(int newModeEIS);

    int btnLayer() const;
    void setBtnLayer(int newBtnLayer);

    int modeAirwaysVisible = 0;
    const int constMaxModeAirWays = 3;

    int varModeDCLRT =1;
    const int constMaxModeDCLRT =3;

    int varModeAirport =1;
    const int constMaxModeAirport =3;

    bool varChartVisible=false;
    int varFuelChanger=0;
    bool varResetFuel=false;
    bool varTOPOvisible=false;
    bool varTerrainVisible=false;

    bool varSTRMSCPVisible=false;
    bool varNEXRADVisible=false;
    bool varXM_LTNGVisible=false;
    bool varTrafficVisible=false;
    bool varCheckListVisible=false;
    bool varEmergencyStart= false;

signals:
    void buttonPressed(int);
    void buttonReleased(int);

    void btnLayerChanged();
    // void modeEISChanged();

    void mapThemeChanged();
    void modeDCLRTChanged(int);
    void modeTerrainChanged(bool);
    void modeAirwaysVisibleChanged(int);

private:
    std::string btnDefault= "#202020";
    std::string btnPressed= "#808080";
    std::string textDefault= "#ffffff";
    std::string textPressed= "#202020";
    std::string textDisable= "#808080";
    QString btnStyleSheet = "font-size: 12px; font-weight: 500; color: " + QString::fromStdString(textDefault) + "; background-color: " + QString::fromStdString(btnDefault) + "; font-family: Franklin Gothic Medium";
    QString btnActiveStyleSheet = "font-size: 12px; font-weight: 500; color: " + QString::fromStdString(textPressed) + "; background-color: " + QString::fromStdString(btnPressed) + "; font-family: Franklin Gothic Medium";

    bool btnEnablePressed[5][12] {
//       1       2      3     4       5     6      7        8     9      0      -      +
/*0*/  {true, false, true,  false , false , false, false, false, false ,true ,  true, true },
/*1*/  {true ,true , true,  false , false , false, false, false, false, false,  true, false},
/*2*/  {true ,true , true , false , true ,  true , true , false, false ,false , true, false},
/*3*/  {true ,false, true , true ,  true,   true,  true,  true,  false, false,  true, false},
/*4*/  {true, false, false ,false , false , true , false, false, false, false,  true, true },
    };
    std::string btnTexts[5][12] {
//       1        2         3      4          5           6          7          8         9     0        -          +
/*0*/ {"ENGINE",  "",      "MAP", "",        "",         "",         "",        "",       "",  "DCLTR","SHW CHRT", "CHKLIST"},//0
/*1*/ {"ENGINE",  "SYSTEM","FUEL","",        "",         "",         "",        "",       "",  "",     "BACK",     ""}, //0Engine
/*2*/ {"ENGINE",  "SYSTEM","FUEL","",        "DEC FUEL", "INC FUEL", "RST FUEL","",       "",  "",     "BACK",     ""}, //1fuel
/*3*/ {"TRAFFIC", "",      "TOPO","TERRAIN", "AIRWAYS",  "STRMSCP",  "NEXRAD",  "XM LTNG","",  "",     "BACK",     ""}, //1map
/*4*/ {"ENGINE",  "",      "",    "",        "",         "DONE",     "",        "",       "",  "",     "EXIT",     "EMERGENCY"} //0CHKLIST
    };

    QHBoxLayout *btnLayoutBox = nullptr;
    QPushButton *buttons[12];

    DataController* dataController = nullptr;

    void setupButtons();
    void updateButton();

    void handleButtonPressed(int btnIdx);
    void handleButtonReleased(int btnIdx);

    int m_Eismode;
    int m_btnLayer=0;
    // int m_modeEIS=0;
};



#endif // MFDSOFTKEY_H
