import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.5

// import Sim_Data_PFD 1.0


Item {
    id: wnd
    width: constFormW
    height:constFormH
    visible:true

    PFD {
        id:pfdContainer
    }

    readonly property int constLCDW: 320
    readonly property int constLCDH: 240
    readonly property int constFormW: 1024  //1290
    readonly property int constFormH: 768   //1080
    readonly property int constWidth1: 738
    readonly property int constWidth2: 612
    readonly property double constScalePdfX:(constFormW*173)/(1185*738) //0.202568   0.885048
    readonly property double constScalePdfY:(constFormH*217)/(891*932)  //0.200691   0.884793
    property double varScaleAspectX: constScalePdfX
    property double varScaleAspectY: constScalePdfY
    property double varScaleAspectMin: Math.min(varScaleAspectX,varScaleAspectY)

    readonly property int constADSBPlaneW:26;
    readonly property int constADSBPlaneH:28;
    property int varADSBPlaneCount:0;
    property int varADSBPlaneSel:-1;


    ///////////text color png////////////////////////////////////////////////////
    readonly property string constFontFamily:"Franklin Gothic Medium"

    readonly property int constIconSliderW: 64
    readonly property int constIconSliderH: 30
    readonly property int constIconTriW: 72
    readonly property int constIconTriH: 58
    readonly property int constIconWingW: 174
    readonly property int constIconWingH: 174

    //Red0 Green1 Blue2 White3 Black4 Amber5 Magenta6 Trans7
    readonly property var constColors    : [
        Qt.rgba(238/256, 56/256, 56/256, 1),
        Qt.rgba(95/256, 187/256, 70/256, 1),
        Qt.rgba(0, 185/256, 241/256, 1),
        Qt.rgba(1, 1, 1, 1),
        Qt.rgba(35/256, 31/256, 32/256, 1),
        Qt.rgba(255/256, 191/256, 0/256, 1),
        Qt.rgba(239/256, 89/256, 161/256, 1),
        "Transparent",
        Qt.rgba(83/256, 54/256, 17/256, 1),
        Qt.rgba(109/256, 110/256, 112/256, 1),Qt.rgba(23/256, 84/256, 274/256, 1)]
    readonly property var constColorStrs : ["Red","Green","Blue","White","Black","Amber","Magenta","Transparent","Brown","Gray","DarkBlue"]
    readonly property var constColorHtmls: ["","","","","","","<font color=\"#EF59A1\">","","","",""]

    readonly property int constWndTypeRoll:22;
    readonly property int constWndTypePitch:23;
    readonly property int constWndTypeYaw:24;
    readonly property int constWndTypeADSBLat:25;
    readonly property int constWndTypeADSBLon:26;
    readonly property int constWndTypeADSBTrack:27;
    readonly property int constWndTypeAltitude:28;
    readonly property int constWndTypeAirspeed:29;
    readonly property int constWndTypeVSI:30;

    //3 7  16
    //N1Bug:0 N1:1 ITT:2 ?:3 OILPSI:4 OILC:5 N2:6 ?:7 DCVOLTS:8 DCAMPS:9 FUEL:10 FUELPPH:11 FUELC:12 CAS:13 TRIM:14 INFO:15 ?:16 CABINALT:17 CABINRATE:18 CABINDESTELV:19 CABINDIFFPSI:20 FLAPS:21 Roll:22 Pitch:23 Yaw:24 ADSBLat:25 ADSBLon:26 ADSBTrack:27 Altitude:28 Airspeed:29 VSI:30 Pitch:31
    readonly property var constSliderValue: [[20,90,105,110],[20,90,105,110],[100,600,800,825,900,1050],[],[0,22,33,90,100,122],[-40,9,135,139,150],[0,100,102,110],[],[0,10,21,32,36,40],[0,145,170,995],[0,200,2200],[0,1050],[-64,-40,50,64],[1,2,3],[-4.00,4.00],[0],[],[0,8100,10000,15000],[-1000,1000],[0],[0,8.6,10],[0],[],[],[],[],[],[],[],[],[],[]]
    readonly property var constColorName:   [[2,2,2,2,2],[0,3,3,0,0],[0,3,3,5,0,0,0],[],[0,0,5,1,5,0,0],[0,5,1,5,0,0],[],[],[0,0,5,1,5,0,0],[0,1,5,0,0],[0,0,3,0],[],[],[],[2,2,2],[],[],[0,1,5,0,0],[1,1,1],[],[0,1,0,0],[],[],[],[],[],[],[],[],[],[],[]]
    readonly property var constTextColor:   [[2,2,2,2,2],[3,1,1,3,3],[3,1,1,4,3,3,3],[],[3,3,4,1,4,3,3],[3,4,1,4,3,3],[3,1,4,3,3],[],[3,3,4,1,4,3,3],[3,1,4,3,3],[3,3,1,3],[3,1,3],[3,4,1,4,3],[0,3,5,0],[2,2,2],[3,3],[],[3,1,4,3,3],[1,1,1],[2,2],[3,1,3,3],[2,2],[],[],[],[],[],[],[],[],[2,6],[3]]
    readonly property var constBackColor:   [[4,4,4,4,4],[0,4,4,0,0],[0,4,4,5,0,0,0],[],[0,0,5,4,5,0,0],[0,5,4,5,0,0],[0,4,5,0,0],[],[0,0,5,4,5,0,0],[0,4,5,0,0],[0,0,4,0],[0,4,0],[0,5,4,5,0],[4,4,4,4],[2,2,2],[4,4],[],[0,4,5,0,0],[4,4,4],[4,4],[0,4,0,0],[4,4],[],[],[],[],[],[],[],[],[4,4],[7]]
    readonly property var constBorderColor: [[4,4,4,4,4],[0,4,4,0,0],[0,4,4,5,0,0,0],[],[0,0,5,4,5,0,0],[0,5,4,5,0,0],[0,4,5,0,0],[],[0,0,5,4,5,0,0],[0,4,5,0,0],[0,0,4,0],[0,4,0],[0,5,4,5,0],[4,4,4,4],[2,2,2],[4,4],[],[0,4,5,0,0],[4,4,4],[4,4],[0,4,0,0],[4,4],[],[],[],[],[],[],[],[],[3,3],[7]]
    readonly property var constSliderPixel: [[808,381,198,136],[808,381,198,136],[825,649,307,273,180,41],[],[427,368,322,206,166,102],[427,403,181,149,103],[0,100,102,110],[],[430,370,325,209,169,105],[430,182,150,104],[636,583,74],[0,1050],[-64,-40,50,64],[1,2,3],[99,514],[0],[],[569,382,351,244],[569,244],[0],[144,423,469],[0],[],[],[],[],[],[],[],[],[],[0,216,432,648,908,1168,1428,1772,2116,2460,2804,3064,3280,3496,3712,3928,4144]]

////////////Dots///////////////////////////////////////////////////////////////
    readonly property int constDotFont7:    120;
    readonly property int constDotFont0:    100;
    readonly property int constDotFont1:     80;
    readonly property int constDotFont2:     60;
    readonly property int constDotBorder:     2;
    readonly property int constDotNeighbour: 15;
    readonly property int constDotText0:    240;
    readonly property int constDotText1:    210;
    readonly property int constDotText2:    160;
    readonly property int constDotText7:    130;
    readonly property int constDotText3:    100;
///////////BEHYAAR////////////////////////////////////////////////////////////
    readonly property int constBEHYAARW: 620/6
    readonly property int constBEHYAARH: 204/6


///////////N1////////////////////////////////////////////////////////////
    readonly property int constN1W: constWidth1
    readonly property int constN1H: 932

///////////Roll Pitch Yaw    Temper    Coord///////////////////////////////
    property int varRollValue:0;   //Jafari 0 to 360
    property int varPitchValue:0;  //Jafari -90 to 90
    property int varYawValue:0;    //Jafari -180 to 180
    property int varTemper : 0;
    property int varCoord : 0;
///////////Altitude////////////////////////////////////////////////////////
    readonly property int constALTW:524  //-->106
    readonly property int constALTH:1711 //-->343

    property int altitudenumOfDisplay: 600 //number of displayed numbers
    readonly property double altitudehCoeficient: 343/altitudenumOfDisplay

    readonly property int constAltitudeRange0: -1500 ; //min
    readonly property int constAltitudeRange1:  55000; //max

    readonly property int constAltitudeH: 14
    property int varAltitudeValue:49380;
    property int varAltitudeY1:0;

    property bool    varAltitudeSign    : varAltitudeValue<0
    property bool    varAltitudeLow     : varAltitudeValue<10000
    property int     varAltitudeAbs     : Math.abs(varAltitudeValue)
    property int     varAltitude4       : Math.floor(varAltitudeAbs/10000)%10
    property int     varAltitude3       : Math.floor(varAltitudeAbs/1000)%10
    property int     varAltitude2       : Math.floor(varAltitudeAbs/100)%10
    property int     varAltitude01      : varAltitudeAbs%100
    property double  varAltitude01Hook  : ((80<=varAltitude01 && varAltitude01<=99) ? ((varAltitude01-80)/20.0) : 0)
    property double  varAltitude2Hook   : ((varAltitude2==9 && 80<=varAltitude01 && varAltitude01<=99) ? ((varAltitude01-80)/20.0) : 0)
    property double  varAltitude3Hook   : ((varAltitude3==9 && varAltitude2==9 && 80<=varAltitude01 && varAltitude01<=99) ? ((varAltitude01-80)/20.0) : 0)

    property string constDigitsTwo :"40\n60\n80\n00\n20\n40\n60\n80\n00\n20"
    property string constDigitsOne :"9\n0\n1\n2\n3\n4\n5\n6\n7\n8\n9\n0"
    property string constDigitsHide:"9\n \n1\n2\n3\n4\n5\n6\n7\n8\n9\n "

///////////Airspeed//////////////////////////////////////////////////////
    property int varAirspeedValue:929;

    property double varAirspeedMin: 20
    property double varAirspeedMax: 500
    property double varAirspeedAccel: 0

    readonly property int constAirspeedRange1: 25; //RF
    readonly property int constAirspeedRange2: 30; //AP
    readonly property int constAirspeedRange3: 40; // E
    readonly property int constAirspeedRange4: 60; // 2
    readonly property int constAirspeedRange5: 80; // R
    readonly property int constAirspeedRange6:100; // 1
    readonly property int constAirspeedRange7:150; //LD
    readonly property int constAirspeedRange8:190; //TA

    property double unitCoeficient: 1
    property double boxHeight: 340
    property int numOfDisplay: 60 //number of displayed numbers
    readonly property double hCoeficient: boxHeight/numOfDisplay
    property double boxWidth: 86
    property double vspeedWidth: 30
    property double shownSpeed: (varAirspeedValue>varAirspeedMin)?varAirspeedValue:varAirspeedMin
    property int speedTA: 40
    property double referenceBugSpeed: 120
    property double referenceApproachSpeed: 67
    property var vspeedsList : [{name: "TA", speed: 190, textColor: constColors[3], visible:true}
                               ,{name: "LD", speed: 150, textColor: constColors[3], visible:true}
                               ,{name: "1",  speed: 100, textColor: constColors[2] , visible:true}
                               ,{name: "R",  speed: 80,  textColor: constColors[2] , visible:true}
                               ,{name: "2",  speed: 60,  textColor: constColors[2] , visible:true}
                               ,{name: "E",  speed: 40,  textColor: constColors[2] , visible:true}
                               ,{name: "AP", speed: 30,  textColor: constColors[2] , visible:true}
                               ,{name: "RF", speed: 25,  textColor: constColors[2] , visible:true}]
///////////VSI//////////////////////////////////////////////
    readonly property int  constVSIW:   332*varScaleAspectX    //67   //constVSIW
    readonly property int  constVSIH:  1561*varScaleAspectY    //313  //constVSIH
    property int    varVSIValue:  0
    property int    varVSIValueY:  0
    property int    varVSIBugValue:  2345

    property double widthVSIr:    222*varScaleAspectX    //45  rectangle
    property double widthVSIa:    99*varScaleAspectX     //20  arrow
    property double widthVSIt:    114*varScaleAspectX    //23  text

    property double heightVSIr:   125*varScaleAspectY    //25
    property double heightVSIa:   50*varScaleAspectY     //10
    property double heightVSIp:   10*varScaleAspectY     //2   zekhamat
    property double heightVSId:   174*varScaleAspectY    //35  distance
    property double heightVSIt:   762*varScaleAspectY    //153

    property double scaleVSIarow: 142*varScaleAspectY    //28.5


    property int varVNVtargetAltitudeVSIvar:2000
    property int varRVSIValue: 1000

    property double widthRVSI: 84*varScaleAspectX       //17
    property double widthRVSIstart: 5*varScaleAspectX   //1
    property double heightRVSI: 130*varScaleAspectY     //26

    property double widthBugVSI: 44*varScaleAspectX     //9
    property double heightBugVSI: 90*varScaleAspectY    //18

    property double widthVNVVSI: 272*varScaleAspectX    //51->55
    property double heightVNVVSI: 115*varScaleAspectY   //19->23

//////////Attitude//////////////////////////////////////////
    readonly property int constAttiW:  372
    readonly property int constAttiH:  1455
    readonly property int constPitchW: 528
    readonly property int constPitchH: 4144
    readonly property int constPitchLineCount: 88
    readonly property int constPitchTextCount: 22

//////////Compass//////////////////////////////////////////
    readonly property int constCompassW: 340

////////Softkey//////////////////////////////////////////
    readonly property int constSoftkeyH: 28;

    readonly property int constXpdrLclW: 302
    readonly property int constXpdrLclH: 24

    readonly property int constMapMiniW: 304
    readonly property int constMapMiniH: 220

             property int alerts: 11



property double horizontalOffset: 20  ///////////Esmaeili

//////////SlipSkid/////////////////////////////
    readonly property double constSlipSkidWidth: 30
    readonly property double constSlipSkidHeight: 33

////////////////////PFD --- SoftKeys //////////////
    property int modeDCLTR : 0
    readonly property int maxModeDCLTR:3

    property int modeTraffic : 0
    readonly property int maxModeTraffic:2

    property int modeBearing1Info : 0
    readonly property int maxModeBearing1Info:3

    property int modeBearing2Info : 0
    readonly property int maxModeBearing2Info:3

    property int modeCDIInfo : 0
    readonly property int maxModeCDIInfo:3

    property bool showAlertWindow: true
    property bool insetTerrainData: true
    property bool insetTopoData : true
    property bool setDefault : true
    property bool showTimeRef : true

    property double hsiDiameter: 288
    property double galRem: 0

    property double mapRightMargin: 10
    property double mapBottomMargin: constXpdrLclH + 5
    property int brg1Status: 0
    property int brg2Status: 0





    //////////Functions/////////////////////////////////////////////////
    //////////Functions/////////////////////////////////////////////////
    //////////Functions/////////////////////////////////////////////////

    // Sim_Data_PFD {
    //     id:ct
    //     onDataChanged: {
    //         wnd.varPitchValue = -1* ct.pitch.toFixed(0);
    //         wnd.varYawValue =  ct.yaw.toFixed(0);
    //         wnd.varRollValue = ct.roll.toFixed(0);

    //         wnd.varAltitudeValue =ct.varIndicatedAltitude.toFixed(0);
    //         wnd.varAirspeedValue =ct.varIndicatedAirSpeed.toFixed(0);
    //         wnd.varVSIValue      =ct.varVerticalSpeed.toFixed(0);
    //         wnd.varVSIValueY      = wnd.varVSIValue;

    //         if(wnd.varVSIValueY > 4000) {
    //             wnd.varVSIValueY = 4000
    //         } else if(wnd.varVSIValueY < -4000) {
    //             wnd.varVSIValueY = -4000
    //         }
    //     }
    //     Component.onCompleted: { updateValues(); }
    // }
    function funcFindIndex(paramWndType,paramValue) {
        var u;
        if (paramValue<constSliderValue[paramWndType][0]) return 0;
        for (u=0;u<constSliderValue[paramWndType].length-1;u++)
            if (constSliderValue[paramWndType][u]<=paramValue && paramValue<constSliderValue[paramWndType][u+1]) return u+1;
        return constSliderValue[paramWndType].length;
    }
    function funcFindPixel(paramWndType,paramValue,paramIndex,paramOffset) {
        var u;
        if (paramIndex===0) u=constSliderPixel[paramWndType][0];
        else if (paramIndex===constSliderValue[paramWndType].length) u=constSliderPixel[paramWndType][paramIndex-1];
        else u= constSliderPixel[paramWndType][paramIndex-1]-(constSliderPixel[paramWndType][paramIndex-1]-constSliderPixel[paramWndType][paramIndex])*(paramValue-constSliderValue[paramWndType][paramIndex-1])/(constSliderValue[paramWndType][paramIndex]-constSliderValue[paramWndType][paramIndex-1]);
        return  u+paramOffset;
    }
}

