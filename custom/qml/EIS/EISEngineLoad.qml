import QtQuick 2.12

Item
{
    id: windowEngineLoadID
    height: containerEIS.constLoadHeight
    width: containerEIS.widthEISComponent

    property int varLoad1: containerEIS.varEngineLoad1*containerEIS.constELoadPixelRange
    property int varLoad2: containerEIS.varEngineLoad2*containerEIS.constELoadPixelRange

    readonly property int labelY: 2
    readonly property int loadY_dis: 19

    readonly property int labelBottomY: 110
    readonly property int barBottomY: labelBottomY - 10// varScaleAspectY*constN1H-80


    Image
    {
        id: loadBG;
        source: "qrc:/custom/images/png/Load.png";

        x:0;
        y:0;
        width: windowEngineLoadID.width;
        height:windowEngineLoadID.height
    }

    Rectangle {
        id:scaleNumbers

        CLabel
        {
            id: loadNum100
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: labelY + (0*loadY_dis)
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"100"
        }
        CLabel
        {
            id: loadNum80
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: labelY + (1*loadY_dis)
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"80"
        }
        CLabel
        {
            id: loadNum60
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: labelY + (2*loadY_dis)
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"60"
        }
        CLabel
        {
            id: loadNum40
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: labelY + (3*loadY_dis)
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"40"
        }
        CLabel
        {
            id: loadNum20
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: labelY + (4*loadY_dis)
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"20"
        }
    }

    CLabel
    {
        id: myIDload
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.wordMidX
        y: labelBottomY
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text:"LOAD%"
    }
    CLabel
    {
        id: labelLoad1
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.smallLeftX;
        y:  labelBottomY
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text: containerEIS.varEngineLoad1.toFixed(0)
    }
    CLabel
    {
        id: labelLoad2
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.smallRightX
        y:  labelBottomY
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text: containerEIS.varEngineLoad2.toFixed(0)
    }

    Rectangle {
        id:slider
        Image
        {
            id: head1;
            source: "qrc:/custom/images/Slider1White.png"
            x:containerEIS.smallLeftX + 7;
            y:barBottomY - varLoad1
            width: containerEIS.sliderWidth;
            height:containerEIS.sliderHeight;
        }
        Image
        {
            id: tail1;
            source: "qrc:/custom/images/SliderTail1White.png"
            x:containerEIS.smallLeftX + 7;
            y:head1.y+head1.height
            width: containerEIS.sliderWidth;
            height:varLoad1;
        }

        Image
        {
            id: head2;
            source: "qrc:/custom/images/Slider2White.png"
            x:containerEIS.smallRightX + 4;
            y:barBottomY - varLoad2
            width: containerEIS.sliderWidth;
            height:containerEIS.sliderHeight;
        }
        Image
        {
            id: tail2;
            source: "qrc:/custom/images/SliderTail2White.png"
            x:containerEIS.smallRightX + 4;
            y:head2.y+head2.height
            width: containerEIS.sliderWidth;
            height:varLoad2;
        }
    }
}

