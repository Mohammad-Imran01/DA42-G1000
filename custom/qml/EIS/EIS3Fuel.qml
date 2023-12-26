import QtQuick 2.12

Item
{
    id: windowFuelID
    width: containerEIS.widthEISComponent
    height: containerEIS.constFuelHeight

    readonly property int y1: 10
    readonly property int y2: 33
    readonly property int y3: y2 + 30
    readonly property int y4: y3 + 30

    Image
    {
        id: loadBG;
        source: "qrc:/custom/images/BG.png";

        x:0;
        y:0;
        width: windowFuelID.width
        height: windowFuelID.height
    }

    Rectangle {
        id:headingMain
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.leftX+5
            y: windowFuelID.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "--------"
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowFuelID.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"Fuel"
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallRightX+2
            y: windowFuelID.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "--------"
        }
    }

    Rectangle {
        id:galIndicator
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallLeftX
            y: windowFuelID.y2
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varFuelQtyVal1.toFixed(0)
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowFuelID.y2
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "GAL"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallRightX
            y: windowFuelID.y2
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varFuelQtyVal2.toFixed(0)
            horizontalAlignment: Text.AlignRight;
        }
    }

    Rectangle {
        id:gphIndicator
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallLeftX
            y: windowFuelID.y3
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varFuelFlowVal1.toFixed(0)
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowFuelID.y3
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "GPH"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallRightX
            y: windowFuelID.y3
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varFuelFlowVal2.toFixed(0)
            horizontalAlignment: Text.AlignRight;
        }
    }

    Rectangle {
        id:tempIndicator
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallLeftX
            y: windowFuelID.y4
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varFuelTempVal1.toFixed(0)
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowFuelID.y4
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"C deg"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.smallRightX
            y: windowFuelID.y4
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varFuelTempVal2.toFixed(0)
            horizontalAlignment: Text.AlignRight;
        }

    }
}


