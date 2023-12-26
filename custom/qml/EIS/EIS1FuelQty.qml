import QtQuick 2.12

 Item
{
    id: windowFuelQtyID
    width: containerEIS.widthEISComponent;
    height:containerEIS.constFuelQtyHeight;


//    p(1-129) v(0-25)
    property int fuelQty1:
        containerEIS.varFuelQtyVal1 * containerEIS.constFuelQtyPixelRange
    property int fuelQty2:
        containerEIS.varFuelQtyVal2 * containerEIS.constFuelQtyPixelRange

    Image
    {
        id: oilBG1;
        source: "qrc:/custom/images/BG.png"

        x:0;
        y:0;
        width: windowFuelQtyID.width
        height:windowFuelQtyID.height
    }
    Image
    {
        id: imgOilBar;
        source: "qrc:/custom/images/png/FuelQty.png"

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
        text:"FUEL QTY GAL"
    }
    Image
    {
        id: indicatorLeft
        source: "qrc:/custom/images/png/whiteTri.png"
        x:containerEIS.triangleBegin + fuelQty1
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
        x:containerEIS.triangleBegin + fuelQty2
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


    readonly property int numDis:25
    readonly property int numX: 6
    readonly property int numY: 77
    readonly property int numW: 5
    readonly property int numH: 5
    CLabel
    {
        id: loadNum0
        paramWndType : 15
        paramIndex: 0
        x: windowFuelQtyID.numX + (0*windowFuelQtyID.numDis)
        y: windowFuelQtyID.numY
        width: numW;
        height: numH;
        text:"0"
    }
    CLabel
    {
        id: loadNum5
        paramWndType : 15
        paramIndex: 0
        x: windowFuelQtyID.numX + (1*windowFuelQtyID.numDis)
        y: windowFuelQtyID.numY
        width: numW;
        height: numH;
        text:"5"
    }
    CLabel
    {
        id: loadNum10
        paramWndType : 15
        paramIndex: 0
        x: windowFuelQtyID.numX + (2*windowFuelQtyID.numDis)
        y: windowFuelQtyID.numY
        width: numW;
        height: numH;
        text:"10"
    }
    CLabel
    {
        id: loadNum15
        paramWndType : 15
        paramIndex: 0
        x: windowFuelQtyID.numX + (3*windowFuelQtyID.numDis)
        y: windowFuelQtyID.numY
        width: numW;
        height: numH;
        text:"15"
    }
    CLabel
    {
        id: loadNum20
        paramWndType : 15
        paramIndex: 0
        x: windowFuelQtyID.numX + (4*windowFuelQtyID.numDis)
        y: windowFuelQtyID.numY
        width: numW;
        height: numH;
        text:"20"
    }
    CLabel
    {
        id: loadNum25
        paramWndType : 15
        paramIndex: 0
        x: windowFuelQtyID.numX + (5*windowFuelQtyID.numDis)
        y: windowFuelQtyID.numY
        width: numW;
        height: numH;
        text:"25"
    }
}


