#ifndef PFDSOFTKEY_H
#define PFDSOFTKEY_H

#include "../data/datacontroller.h"
#include <QObject>
#include <QPushButton>
#include <QHBoxLayout>

class PFDSoftKey:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int btnLayer READ btnLayer WRITE setBtnLayer NOTIFY btnLayerChanged FINAL)
public:
    explicit PFDSoftKey(DataController* dataController_,QObject *parent = nullptr);
    QHBoxLayout * getWidget() const {
        return btnLayoutBox;
    }
    int btnLayer() const;
    void setBtnLayer(int newBtnLayer);

signals:
    void buttonPressed(int);
    void buttonReleased(int);

    void btnLayerChanged();

private:
    std::string btnDefault= "#202020";
    std::string btnPressed= "#808080";
    std::string textDefault= "#ffffff";
    std::string textPressed= "#202020";
    std::string textDisable= "#808080";
    QString btnStyleSheet = "font-size: 12px; font-weight: 500; color: " + QString::fromStdString(textDefault) + "; background-color: " + QString::fromStdString(btnDefault) + "; font-family: Franklin Gothic Medium";
    QString btnActiveStyleSheet = "font-size: 12px; font-weight: 500; color: " + QString::fromStdString(textPressed) + "; background-color: " + QString::fromStdString(btnPressed) + "; font-family: Franklin Gothic Medium";

    int modeDCLTR = 0;
    const int maxModeDCLTR=3;

    int modeTraffic = 0;
    const int maxModeTraffic=2;

    int modeBearing1Info = 0;
    const int maxModeBearing1Info=3;

    int modeBearing2Info = 0;
    const int maxModeBearing2Info=3;

    int modeCDIInfo = 0;
    const int maxModeCDIInfo=3;

    //     bool showAlertWindow= true;
    // bool insetTerrainData= true;
    //     bool insetTopoData = true;
    // bool setDefault = true;
    //     bool showTimeRef = true;

    // double hsiDiameter= 288;
    //     double galRem= 0;

    // double mapRightMargin= 10;
    //     int brg1Status= 0;
    //     int brg2Status= 0;



    std::string textColor[12] = {
        textDefault, textDefault, textDefault, textDefault,
        textDefault, textDefault, textDefault, textDefault,
        textDefault, textDefault, textDefault, textDefault
    };
    std::string backgroundColor[12] = {
        btnDefault, btnDefault, btnDefault, btnDefault,
        btnDefault, btnDefault, btnDefault, btnDefault,
        btnDefault, btnDefault, btnDefault, btnDefault
    };

    std::string btnTexts[9][12] = {
        //        1            2         3           4           5       6          7         8       9            0          -       +
        /*0*/    {"",        "INSET",    "",        "PFD",      "OBS",  "CDI",     "ADF/DME", "XPDR", "IDENT",   "TMR/REF",  "NRST", "1"},
        /*1*/    {"OFF",     "DCLTR",    "",        "TRAFFIC",  "TOPO", "TERRAIN", "",        "",     "",        "",         "BACK", "1"}, //if -> 0 - INSET
        /*2*/    {"SYN VIS", "DFLTS",    "WIND",    "DME",      "BRG1", "HSI FMT", "BRG2",    "",     "ALT UNIT","STD BARO", "BACK", "1"},//if -> 0 - PFD
        /*3*/    {"PATHWAY", "SYN TERR", "HRZN HDG","APTSIGNS", "",     "",        "",        "",     "",        "",         "BACK", "1"}, // 0 -> pfd -> SYN VIS
        /*4*/    {"",        "",         "OPTN1",   "OPTN2",    "OPTN3","OFF",     "",        "",     "",        "",         "BACK", "1"},// 0 -> pfd -> DFLTS
        /*5*/    {"",        "",         "",        "",         "",     "360 HSI", "ARC HSI", "",     "",        "",         "BACK", "1"},// 0 -> pfd -> HSI FMT
        /*6*/    {"",        "",         "",        "",         "",     "METERS",  "",        "IN",   "HPA",     "",         "BACK", "1"},// 0 -> pfd -> ALT UNIT
        /*7*/    {"",        "",         "STBY",    "ON",       "ALT",  "GND",     "VFR",     "CODE", "IDENT",   "",         "BACK", "1"},//0 - XPDR
        /*8*/    {"0",       "1",        "2",       "3",        "4",    "5",       "6",       "7",    "IDENT",   "BKSP",     "BACK", "1"}//0 - XPDR - Code
    };
    bool btnEnablePressed[9][12] = {
        //        1       2      3     4       5     6      7      8       9      0      -      +
        /*0*/   {false, true , false, true , true , true , true , true , true , true , true , true },
        /*1*/   {true , true , false, true , true , true , false, false, false, false, true , true }, //if -> 0 - INSET
        /*2*/   {true , true , true , true , true , true , true , false, true , true , true , true },//if -> 0 - PFD
        /*3*/   {true , true , true , true , false, false, false, false, false, false, true , true }, // 0 -> pfd -> SYN VIS
        /*4*/   {false, false, true , true , true , true , false, false, false, false, true , true },// 0 -> pfd -> DFLTS
        /*5*/   {false, false, false, false, false, true , true , false, false, false, true , true },// 0 -> pfd -> HSI FMT
        /*6*/   {false, false, false, false, false, true , false, true , true , false, true , true },// 0 -> pfd -> ALT UNIT
        /*7*/   {false, false, true , true , true , true , true , true , true , false, true , true },//0 - XPDR
        /*8*/   {true , true , true , true , true , true , true , true , true , true , true , true }//0 - XPDR - Code
    };



    // QQuickWidget* softKeyWidget = nullptr;
    QHBoxLayout *btnLayoutBox = nullptr;
    QPushButton *buttons[12];
    DataController* dataController = nullptr;

    int m_btnLayer=0;

    void setupButtons();
    void updateButton();

    void handleButtonPressed(int);
    void handleButtonReleased(int);
};

#endif // PFDSOFTKEY_H
