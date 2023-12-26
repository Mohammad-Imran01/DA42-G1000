import QtQuick 2.12

Item
{
    id: windowFuelFlowID
    width: containerEIS.widthEISComponent
    height:containerEIS.constFuelFlowHeight

    readonly property int y1: 5
    readonly property int y2: 25

    Image
    {
        id: loadBG;
        source: "qrc:/custom/images/BG.png";

        x:0;
        y:0;
        width: windowFuelFlowID.width
        height:windowFuelFlowID.width
    }
    CLabel
    {
        id: mfdFuelFlow
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.wordMidX
        y: y1
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text:"FUEL FLOW"
    }

    CLabel
    {
        id: mfdFuelFlow1
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.smallLeftX
        y: y2
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text:containerEIS.varFuelFlowVal1.toFixed(1)
    }
    CLabel
    {
        id: fuelFlow
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.wordMidX
        y: y2
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text:"GPH"
    }
    CLabel
    {
        id: mfdFuelFlow2
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.smallRightX
        y: y2
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text:containerEIS.varFuelFlowVal2.toFixed(1)
    }

}


