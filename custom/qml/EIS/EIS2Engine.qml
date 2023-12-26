import QtQuick 2.12

Item
{
    id: windowEngine
    width: containerEIS.widthEISComponent
    height: containerEIS.constEngineHeight

    Image
    {
        id: imgBG;
        source: "qrc:/custom/images/BG.png";
        x:0;
        y:0
        width: windowEngine.width
        height:windowEngine.height
    }

    property double varGboxVal1:    (containerEIS.constGearBPixelRange * containerEIS.varGearBVal1).toFixed(0)
    property double varGboxVal2:    (containerEIS.constGearBPixelRange * containerEIS.varGearBVal2).toFixed(0)

    readonly property int y0: 0
    readonly property int y1: 5


    readonly property int voltImgY: 54 //img
    readonly property int headingY: voltImgY-27
    readonly property int dataY: voltImgY - 10 // name & vals
    readonly property int voltLTriY: voltImgY + 10 // leftT
    readonly property int voltRTriY: voltLTriY + 22 // rightT

    readonly property int gadgeDistance: 82
    //y1


//    Volts
    Rectangle {
        //y4 image


        Image {
            source: "qrc:/custom/images/png/gearBox.png"

            x:containerEIS.horizontalImg_x;
            y:windowEngine.voltImgY;
            width: containerEIS.widthHImg;
            height:containerEIS.heightHImg;

        }
        Image {
            id: indicatorLeft
            source: "qrc:/custom/images/png/whiteTri.png"
            x: containerEIS.triangleBegin +windowEngine.varGboxVal1
            y:windowEngine.voltLTriY
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
        Image {
            id: indicatorRight;
            source: "qrc:/custom/images/png/whiteTri.png"
            x:containerEIS.triangleBegin +windowEngine.varGboxVal2
            y:windowEngine.voltRTriY
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

        Rectangle {
            CLabel
            {
                paramWndType : 15
                paramIndex: 0
                x: containerEIS.wordMidX
                y: headingY
                width: containerEIS.scaleNumW;
                height: containerEIS.scaleNumH;
                text:"GEARBOX"
            }
            Text{
                font.bold: true
                font.pixelSize: containerEIS.fontMD
                color:"#fff"
                font.family: containerEIS.constFontFamily

                x: containerEIS.leftX
                y: windowEngine.dataY

                text: containerEIS.varGearBVal1
            }
            CLabel
            {
                paramWndType : 15
                paramIndex: 0
                x: containerEIS.wordMidX
                y: windowEngine.dataY
                width: containerEIS.scaleNumW;
                height: containerEIS.scaleNumH;
                text:"C deg"
            }
            CLabel
            {
                paramWndType : 15
                paramIndex: 0
                x: containerEIS.rightX
                width: containerEIS.scaleNumW;
                height: containerEIS.scaleNumH;
                horizontalAlignment: Text.AlignRight;
                y: windowEngine.dataY
                text: containerEIS.varGearBVal2
            }

        }
    }

    Rectangle {
        id:headingEngineID
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.leftX
            y: windowEngine.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "------"
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowEngine.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"ENGINE"
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX-2
            y: windowEngine.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "------"
        }
    }

    Rectangle {
        Text{
            font.bold: true
            font.pixelSize: containerEIS.fontMD
            color:"#fff"
            font.family: "Franklin Gothic Medium"

            x: containerEIS.leftX
            y: windowEngine.dataY + gadgeDistance

            text: containerEIS.varCoolantTempVal1.toFixed(0)
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowEngine.dataY + gadgeDistance
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"C deg"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX
            y: windowEngine.dataY + gadgeDistance
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varCoolantTempVal2.toFixed(0)
            horizontalAlignment: Text.AlignRight;
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: headingY +gadgeDistance
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"COOLANT"
        }
    }

}



















