import QtQuick 2.12

Item
{
    id: windowFuelCalcID
    width: containerEIS.widthEISComponent
    height: containerEIS.constFuelCalcHeight


//    property double varGalRemVal: containerEIS.varGalRemVal.toFixed(1)
//    property double varGalUsedVal: containerEIS.varGalUsedVal.toFixed(1)
//    property string varEndurVal: containerEIS.varEndurVal
//    property double varRangeVal: containerEIS.varRangeVal.toFixed(1)


    readonly property int x1:11 //varScaleAspectX*constIconSliderH+5;
    readonly property int x3:containerEIS.smallRight-5

    readonly property int y1: 10
    readonly property int y2: y1 + 22
    readonly property int y3: y2 + 26
    readonly property int y4: y3 + 26
    readonly property int y5: y4 + 26

    Image
    {
        id: loadBG;
        source: "qrc:/custom/images/BG.png";

        x:0;
        y:0;
        width: windowFuelCalcID.width
        height: windowFuelCalcID.height;
    }

    Rectangle {
        id:headingMain
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.leftX
            y: windowFuelCalcID.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "-----"
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowFuelCalcID.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"FUEL CALC"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallRightX+6
            y: windowFuelCalcID.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "-----"
        }
    }


    Rectangle {
        id:galRemIndicatorID
        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallLeftX - 5
            y: windowFuelCalcID.y2
            text: "GAL REM"
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignLeft;
        }
        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignRight;
            y: windowFuelCalcID.y2
            text: containerEIS.varGalRemVal.toFixed(1) + containerEIS.varFuelChanger
        }
    }
    Rectangle {
        id:galUsedIndicatorID
        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallLeftX - 5
            y: windowFuelCalcID.y3
            text: "GAL USED"
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignLeft;
        }

        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignRight;
            y: windowFuelCalcID.y3
            text: containerEIS.varGalUsedVal.toFixed(1)
        }

    }
    Rectangle {
        id:endurIndicatorID        
        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallLeftX - 5
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignLeft;
            y: windowFuelCalcID.y4
            text: "ENDUR"
        }

        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignRight;
            y: windowFuelCalcID.y4
            text: containerEIS.varEndurVal
        }
    }
    Rectangle {
        id:rangeIndicatorID

        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallLeftX - 5
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignLeft;
            y: windowFuelCalcID.y5
            text: "RANGE NM"
        }
        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignRight;
            y: windowFuelCalcID.y5
            text: containerEIS.varRangeVal.toFixed(0)
        }

    }
}


