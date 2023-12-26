import QtQuick 2.12

 Item
{
    id: windowOilPressID
    width: containerEIS.widthEISComponent;
    height:containerEIS.constOilPressHeight;

    property int oilPress1:
        containerEIS.varOilPressVal1*containerEIS.constOILPressPixelRange
    property int oilPress2:
        containerEIS.varOilPressVal2*containerEIS.constOILPressPixelRange

    Image
    {
        id: oilBG1;
        source: "qrc:/custom/images/BG.png"

        x:0;
        y:0;
        width: windowOilPressID.width
        height:windowOilPressID.width
    }
    Image
    {
        id: imgOilBar;
        source: "qrc:/custom/images/png/OilPress.png"

        x:containerEIS.horizontalImg_x;
        y:containerEIS.horizontalImg_y;
        width: containerEIS.widthHImg;
        height:containerEIS.heightHImg;
    }

    CLabel
    {
        id: nameLabel
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.wordMidX
        y: 8
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text:"OIL PRES"
    }
    Image
    {
        id: indicatorLeft
        source: "qrc:/custom/images/png/whiteTri.png"
        x:containerEIS.triangleBegin+oilPress1
        y:containerEIS.horizontalEISHeadY
        width: containerEIS.constTriangleSize;
        height:containerEIS.constTriangleSize;
        visible:true
        transformOrigin: Item.Center
        rotation: 90

        Text {
            id: l
            x:parent.width/2-6
            y:parent.height/2-6
            text: qsTr("L")
            font.bold: true

            font.pixelSize: 11

            transformOrigin: Item.Center
            rotation: -90
        }
    }
    Image
    {
        id: indicatorRight;
        source: "qrc:/custom/images/png/whiteTri.png"
        x:triangleBegin+oilPress2
        y:containerEIS.horizontalEISHeadY+22
        width: containerEIS.constTriangleSize;
        height:containerEIS.constTriangleSize;
        visible:true

        transformOrigin: Item.Center
        rotation: -90
        Text {
            id: r
            x:parent.width/2-6
            y:parent.height/2-6
            font.pixelSize: 11
            text: qsTr("R")
            font.bold: true
            transformOrigin: Item.Center
            rotation: 90
        }
    }
}


