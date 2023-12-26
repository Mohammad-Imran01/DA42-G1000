import QtQuick 2.12

Item
{
    id: windowRPMID
    height: containerEIS.constRPMHeight
    width: containerEIS.widthEISComponent

    property int varRPM1: containerEIS.varRPM1 * containerEIS.constRPMPixelRange
    property int varRPM2: containerEIS.varRPM2 * containerEIS.constRPMPixelRange

    readonly property int labelY: 2
    readonly property int loadY_dis: 19

    readonly property int labelBottomY: 109
    readonly property int barBottomY: labelBottomY - 10// varScaleAspectY*constN1H-80

    Image
    {
        id: loadBG;
        source: "qrc:/custom/images/png/RPM.png";

        x:0;
        y:0;
        width: windowRPMID.width;
        height: windowRPMID.height;
    }

    CLabel
    {
        id: loadNum100
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.wordMidX
        y: labelY + (0*loadY_dis)
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text:"3000"
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
        text:"2400"
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
        text:"1800"
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
        text:"1200"
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
        text:"600"
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
        text:"RPM"
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
        text: containerEIS.varRPM1.toFixed(0)
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
        text: containerEIS.varRPM2.toFixed(0)
    }

    Rectangle {
        id:slider
        Image
        {
            id: head1;
            source: "qrc:/custom/images/Slider1White.png"
            x:containerEIS.smallLeftX + 7;
            y:barBottomY - varRPM1
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
            height:varRPM1;
        }

        Image
        {
            id: head2;
            source: "qrc:/custom/images/Slider2White.png"
            x:containerEIS.smallRightX + 4;
            y:barBottomY - varRPM2
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
            height:varRPM2;
        }
    }
}

