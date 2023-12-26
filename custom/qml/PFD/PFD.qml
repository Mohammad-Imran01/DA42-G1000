import QtQuick 2.12
import QtQuick.Controls 2.5

import "../EIS"
import "../NAVCOM"


Item {
    Rectangle
    {
        id:myIDBack
        readonly property double pitchEdge: 21
        readonly property double divideValue: 70
        readonly property double shiftValue: -5
        x:      0//myIDLeft.width+varScaleAspectX*constDotNeighbour //removed left bar from pfd
        y:      myIDTop.height+varScaleAspectY*constDotNeighbour
        width:  wnd.width+3//-myIDLeft.width-varScaleAspectX*constDotNeighbour //removed left bar from pfd
        height: wnd.height-myIDTop.height-2*varScaleAspectY*constDotNeighbour

        clip: true

        Rectangle
        {//-24 -8  -18
            id:myIDBlue
            x:      -myIDBack.width
            y:      -myIDBack.height-129+varPitchValue*constAttiW/90.0  //cheghadr?
            width:  myIDBack.width*3
            height: myIDBack.height*1.5
            color:  constColors[10]
            antialiasing: true
            transform: Rotation
            {
                origin.x: myIDBack.width+airspeed.width+2*varScaleAspectX*constDotNeighbour+constAttiW/2
                origin.y: myIDBack.height*1.5+varPitchValue*constAttiW/90.0
                axis { x: 0; y: 0; z: 1 }
                angle: varRollValue
            }
        }

        Rectangle
        {
            id:myIDBrown
            x:      -myIDBack.width
            y:      myIDBack.height/2+varScaleAspectX*constDotNeighbour-129+varPitchValue*constAttiW/90.0   //cheghadr?
            width:  myIDBack.width*3
            height: myIDBack.height*1.5
            color: constColors[8]
            antialiasing: true
            transform: Rotation {
                origin.x: myIDBack.width+airspeed.width+2*varScaleAspectX*constDotNeighbour+constAttiW/2
                origin.y: 0+varPitchValue*constAttiW/90.0
                axis { x: 0; y: 0; z: 1 }
                angle: varRollValue
            }
        }
    }
    NAVCOM
    {
        id: myIDTop
        x:0
        y:0
    }
    EIS {
        id: myIDLeft
        visible:true
        x:0
        y:myIDTop.height+varScaleAspectY*constDotNeighbour

    }
    Window1AirSpeed
    {
        id: airspeed
        x:myIDLeft.width+2*varScaleAspectX*constDotNeighbour
        y:myIDTop.height+228-varScaleAspectY*constALTH/2  //111.5 Mustang
    }

    Window1Attitude
    {
        id: attitudeIndicator
        x:myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour
        y:myIDTop.height+228-varScaleAspectY*constALTH/2-20 //chera?
    }

    JSlipAndSkid
    {
        id: slipAndSkid
        x:myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour+constAttiW/2-constSlipSkidWidth/2
        y:myIDTop.height+228-varScaleAspectY*constALTH/2-20 //chera?
    }

    Window1AircraftSymbol
    {
        id: aircraftSymbol
        x:myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour-horizontalOffset
        y:myIDTop.height+228-varScaleAspectY*constALTH/2-14  //Esmaeili chera?
    }
    Window1Compass
    {
        id:compassSymbol;
        x: myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour+constAttiW/2 - constCompassW / 2
        y: myIDTop.height+530 - constCompassW / 2
    }

    JDME
    {
        id: dme;
        x:  myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour+constAttiW/2 - dme.width
        y:  compassSymbol.y+ constCompassW / 2
    }
    Window1Bearing1
    {
        id: brg1Component
        x:  myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour+constAttiW/2 - dme.width
        y:  compassSymbol.y+ constCompassW / 2+88
        status: 1
    }
    Window1Bearing2
    {
        id: brg2Component
        x:  myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour+constAttiW/2
        y:  compassSymbol.y+ constCompassW / 2+88
        status: 2
    }
    Image
    {
        id: icon
        x:      myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour+constAttiW/2 - constADSBPlaneW/2
        y:      compassSymbol.y+ constCompassW / 2 - constADSBPlaneH/2
        width:  constADSBPlaneW
        height: constADSBPlaneH
        source: "qrc:/custom/images/PlaneWhite.png"
    }

    Window1Altitude
    {
        id: altitude
        x:myIDLeft.width+airspeed.width+aircraftSymbol.width+4*varScaleAspectX*constDotNeighbour;
        y:myIDTop.height+228-varScaleAspectY*constALTH/2  //113.29 Mustang
    }

    Window1VSI
    {
        id:verticalspeed
        x:myIDLeft.width+airspeed.width+aircraftSymbol.width+altitude.width+5*varScaleAspectX*constDotNeighbour;
        y:myIDTop.height+228  //113.29 Mustang
    }

    JHeadingTXT
    {
        x: myIDLeft.width+airspeed.width+3*varScaleAspectX*constDotNeighbour+constAttiW/2 - 36
        y: 344+myIDTop.height
    }

    // JPFDSoftkeys
    // {
    //     id: pfdSoftkeysID
    //     y: wnd.height-height
    // }



//old
    Rectangle {
        id:buttonContainer
        visible:false


        JXPDR_LCL   {}
        //JINSET      {} //mapContent == 1
        JTMR        {} //mapContent == 2

        JWindData   {}



        Text {
            visible: false
            text: airspeeds.value
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 200
            color: constColors[3]
        }
        Text {
            visible: false
            text: altitudes.value
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            anchors.left: parent.left
            anchors.leftMargin: 200
            color: constColors[3]
        }
        Slider {
            visible: false
            id: airspeeds
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: 20
            value: 20
            to: 500
            onValueChanged: {
                airspeed.setData(airspeeds.value)
            }
        }
        Slider {
            visible: false
            id: altitudes
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: -1000
            value: -1000
            to: 4000
            onValueChanged: {
                altitude.setData(altitudes.value)
            }
        }

        Slider {
            visible: false
            //visible: gpsCheck.checked
            id: gpsSlider
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: 0
            value: 15
            to: 360
        }
        Slider {
            visible: false
            //visible: gpsCheck.checked
            id: gpsOffset
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 70
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: -90
            value: 0
            to: 90
        }
        Slider {
            visible: false
            //visible: vor1Check.checked
            id: vorOneSlider
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: 0
            value: 73
            to: 360
        }
        Slider {
            visible: false
            //visible: vor1Check.checked
            id: vorOneOffset
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 70
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: -90
            value: -32
            to: 90
        }
        Slider {
            visible: false
            //visible: vor2Check.checked
            id: vorTwoSlider
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: 0
            value: 192
            to: 360
        }
        Slider {
            visible: false
    //        visible: vor2Check.checked
            id: vorTwoOffset
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 70
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: -90
            value: 56
            to: 90
        }
        Slider {
            visible: false
            //visible: brg1Check.checked
            id: brgOneSlider
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: 0
            value: 265
            to: 360
        }
        Slider {
            visible: false
            //visible: brg2Check.checked
            id: brgTwoSlider
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 40
            from: 0
            value: 205
            to: 360
        }
        Column {
            visible: false
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 140
            anchors.right: parent.right
            anchors.rightMargin: 70
            RadioButton
            {//magenta
                id: gpsCheck
                checked: false //Esmaeili
                text: qsTr("GPS")
            }
            RadioButton
            {//green1line
                id: vor1Check
                checked: true //Esmaeili
                text: qsTr("VOR1")
            }
            RadioButton
            {//green2line
                id: vor2Check
                checked: false //Esmaeili
                text: qsTr("VOR2")
            }
        }
        Column {
            visible: false
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 140
            anchors.right: parent.right
            anchors.rightMargin: 160
            RadioButton
            {//blue1line
                id: brg1Check
                checked: false //Esmaeili
                text: qsTr("BRG1")
            }
            RadioButton
            {//blue2line
                id: brg2Check
                checked: false //Esmaeili
                text: qsTr("BRG2")
            }
        }
    }
    JINSET {
        id:btnWindowINSET
        visible:false
    }
    JNRST {
        visible: false
        id:btnWindowNRST
    }
    JXPDR_LCL {
        visible:false
        id:btnWindowXPDR
    }
}
