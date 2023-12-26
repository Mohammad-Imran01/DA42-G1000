import QtQuick 2.12

 Item
{
    id: windowOilTempID
    width:containerEIS.widthEISComponent
    height:containerEIS.constOilTempHeight

    property int oilTemp1:
        containerEIS.varOilTempVal1 * containerEIS.constOILTempPixelRange
    property int oilTemp2:
        containerEIS.varOilTempVal2 * containerEIS.constOILTempPixelRange


    Image
    {
        id: oilBG1;
        source: "qrc:/custom/images/BG.png"

        x:0;
        y:0;
        width: windowOilTempID.width
        height:windowOilTempID.height
    }
    Image
    {
        id: imgOilBar;
        source: "qrc:/custom/images/png/OILT.png"

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
        text:"OIL TEMP"
    }
    Image
    {
        id: indicatorLeft
        source: "qrc:/custom/images/png/whiteTri.png"
        x:containerEIS.triangleBegin + windowOilTempID.oilTemp1
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
        x:containerEIS.triangleBegin + windowOilTempID.oilTemp2
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


