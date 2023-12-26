import QtQuick 2.12

Item
{
    id: windowTimeSVC
    width: containerEIS.widthEISComponent
    height: containerEIS.constFuelCalcHeight

    property string varEndurVal: containerEIS.varTimeSVCVal  + "   " + "HRS"

    readonly property int y1: 10
    readonly property int y2: 40

    Image
    {
        id: imgBG;
        source: "qrc:/custom/images/BG.png";

        x:0;
        y:0;
        width: windowTimeSVC.width
        height: windowTimeSVC.height
    }

    Rectangle {
        id:svcTimeID
        CLabel
        {

            paramWndType : 15
            paramIndex: 0

            x: containerEIS.wordMidX
            y:ttl.y + ttl.height - 5
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "-----------------------------"
        }

        CLabel
        {
            id:ttl
            paramWndType : 15
            paramIndex: 0

            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "TTL TIME IN SVC"
            x: containerEIS.wordMidX
            y: windowTimeSVC.y1
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0

            x: containerEIS.wordMidX
            y:windowTimeSVC.y2
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: varEndurVal
        }
    }

}


