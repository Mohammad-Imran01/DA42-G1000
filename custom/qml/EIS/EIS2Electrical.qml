import QtQuick 2.12

Item
{
    id: windowElectrical
    width: containerEIS.widthEISComponent
    height: containerEIS.constElecHeight

    Image
    {
        id: imgBG;
        source: "qrc:/custom/images/BG.png";
        x:0;
        y:0
        width: windowElectrical.width
        height: windowElectrical.height
    }

    property double varVoltsVal1: (containerEIS.constVoltPixelRange*containerEIS.varVoltVal1).toFixed(1)
    property double varVoltsVal2: (containerEIS.constVoltPixelRange*containerEIS.varVoltVal2).toFixed(1)
    property double varAmpsVal1: (containerEIS.constAmpPixelRange*containerEIS.varAmpVal1).toFixed(0)
    property double varAmpsVal2: (containerEIS.constAmpPixelRange*containerEIS.varAmpVal2).toFixed(0)



    readonly property int y1: 5

    readonly property int voltImgY: 43 //img
    readonly property int dataY: voltImgY - 10 // name & vals
    readonly property int voltLTriY: voltImgY + 10 // YleftT
    readonly property int voltRTriY: voltLTriY + 22 // YrightT

    readonly property int gadgeDistance: 60

//    Volts
    Rectangle {
        id: windowVoltsID
        //y4 image
        Image
        {
            id: imgvolts;
            source: "qrc:/custom/images/png/volts.png"

            x:containerEIS.horizontalImg_x;
            y:windowElectrical.voltImgY;
            width: containerEIS.widthHImg;
            height:containerEIS.heightHImg;
        }
        Image
        {
            id: indicatorLeft
            source: "qrc:/custom/images/png/whiteTri.png"
            x: containerEIS.triangleBegin + windowElectrical.varVoltsVal1
            y:windowElectrical.voltLTriY
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
            x: containerEIS.triangleBegin + windowElectrical.varVoltsVal2
            y:windowElectrical.voltRTriY
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

    Rectangle {
        id:headingVoltlID
        Text{
            font.bold: true
            font.pixelSize: containerEIS.fontMD
            color:"#fff"
            font.family: containerEIS.constFontFamily

            x: containerEIS.leftX
            y: windowElectrical.dataY

            text: containerEIS.varVoltVal1.toFixed(0)
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowElectrical.dataY
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"VOLTS"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX
            y: windowElectrical.dataY
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varVoltVal2.toFixed(0)
            horizontalAlignment: Text.AlignRight;
        }
    }


    Rectangle {
        id: windowAmpsID
        //y4 image
        Image
        {
            id: imgAmps;
            source: "qrc:/custom/images/png/apms.png"

            x:containerEIS.horizontalImg_x;
            y:windowElectrical.voltImgY + gadgeDistance;
            width: containerEIS.widthHImg;
            height:containerEIS.heightHImg;
        }
        Image
        {
            source: "qrc:/custom/images/png/whiteTri.png"
            x:containerEIS.triangleBegin + windowElectrical.varAmpsVal1
            y:windowElectrical.voltLTriY + gadgeDistance
            width: containerEIS.constTriangleSize;
            height:containerEIS.constTriangleSize;
            visible:true
            transformOrigin: Item.Center
            rotation: 90

            Text {
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
            source: "qrc:/custom/images/png/whiteTri.png"
            x:containerEIS.triangleBegin + windowElectrical.varAmpsVal2
            y:windowElectrical.voltRTriY + gadgeDistance
            width: containerEIS.constTriangleSize;
            height:containerEIS.constTriangleSize;
            visible:true

            transformOrigin: Item.Center
            rotation: -90
            Text {
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
    Rectangle {
        id:headingAmplID
        Text{
            font.bold: true
            font.pixelSize: containerEIS.fontMD
            color:"#fff"
            font.family: containerEIS.constFontFamily

            x: containerEIS.leftX
            y: windowElectrical.dataY + gadgeDistance

            text: containerEIS.varAmpVal1.toFixed(0)
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowElectrical.dataY + gadgeDistance
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"AMPS"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX
            y: windowElectrical.dataY + gadgeDistance
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: containerEIS.varAmpVal2.toFixed(0)
            horizontalAlignment: Text.AlignRight;

        }
    }

    //main heading
    Rectangle {
        id:headingElectricalID

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.leftX
            y: windowElectrical.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "----"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowElectrical.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"ELECTRICAL"
        }
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX-2
            y: windowElectrical.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "----"
        }
    }
}



















