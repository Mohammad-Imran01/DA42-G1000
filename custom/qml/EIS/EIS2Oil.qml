import QtQuick 2.12

Item
{
    id: windowOil
    width: containerEIS.widthEISComponent
    height: containerEIS.constOilHeight

    Image
    {
        id: imgBG;
        source: "qrc:/custom/images/BG.png";
        x:0;
        y:0
        width: windowOil.width
        height: windowOil.height
    }


    property double varDEICEFLUID: (containerEIS.constDFluidRange * containerEIS.varDFluid).toFixed(0)

    readonly property int y1: 5

    readonly property int voltImgY: 70 //img
    readonly property int headingY: voltImgY-3

    readonly property int voltLTriY: voltImgY + 15 // leftT

    readonly property int dataCY: voltImgY - 44 // name & vals
    readonly property int dataBarY: voltImgY - 24 // name & vals

    // OIL
    Rectangle {
        Image {
            source: "qrc:/custom/images/png/fluid.png"

            x:containerEIS.horizontalImg_x;
            y:windowOil.voltImgY;
            width: containerEIS.widthHImg;
            height:containerEIS.heightHImg;
        }
        Image {
            id: indicatorLeft
            source: "qrc:/custom/images/png/whiteTri.png"
            x: containerEIS.triangleBegin + windowOil.varDEICEFLUID
            y:windowOil.voltLTriY
            width: containerEIS.constTriangleSize;
            height:containerEIS.constTriangleSize;
            visible:true
            transformOrigin: Item.Center
            rotation: 90
        }
    }

    Rectangle {
            Text{
                font.bold: true
                font.pixelSize: containerEIS.fontMD
                color:"#fff"
                font.family: containerEIS.constFontFamily

                x: containerEIS.leftX
                y: windowOil.dataCY

                text: containerEIS.varOilTempVal1.toFixed(0)
            }
            CLabel
            {
                paramWndType : 15
                paramIndex: 0
                x: containerEIS.wordMidX
                y: windowOil.dataCY
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
                y: windowOil.dataCY

                text: containerEIS.varOilTempVal2.toFixed(0)
            }

        }

    Rectangle {            
        Text {
            font.bold: true
            font.pixelSize: containerEIS.fontMD
            color:"#fff"
            font.family: "Franklin Gothic Medium"

            x: containerEIS.leftX
            y: windowOil.dataBarY

            text: containerEIS.varOilPressVal1.toFixed(0)
        }
        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowOil.dataBarY
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"BAR"
        }
        CLabel {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            horizontalAlignment: Text.AlignRight;
            y: windowOil.dataBarY

            text: containerEIS.varOilPressVal2.toFixed(0)
        }
    }

    Rectangle {
        id:headingOilID
        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.leftX+5
            y: windowOil.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "--------"
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.wordMidX
            y: windowOil.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text:"OIL"
        }

        CLabel
        {
            paramWndType : 15
            paramIndex: 0
            x: containerEIS.rightX-7
            y: windowOil.y1
            width: containerEIS.scaleNumW;
            height: containerEIS.scaleNumH;
            text: "--------"
        }
    }
    CLabel {
        paramWndType : 15
        paramIndex: 0
        x: containerEIS.wordMidX
        y: headingY
        width: containerEIS.scaleNumW;
        height: containerEIS.scaleNumH;
        text:"DEICE FLUID"
    }
}




















