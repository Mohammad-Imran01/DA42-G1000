import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.0

Rectangle {
    property double nav1StandbyFrequency: minNavFreq
    property double nav1ActiveFrequency: minNavFreq
    property double nav2StandbyFrequency: minNavFreq
    property double nav2ActiveFrequency: minNavFreq
    property double com1StandbyFrequency: minComFreq
    property double com1ActiveFrequency: minComFreq
    property double com2StandbyFrequency: minComFreq
    property double com2ActiveFrequency: minComFreq
    property bool nav1ID: false
    property bool nav2ID: false
    property bool selectedStandbyNav: true // true -> nav1  false -> nav2
    property bool selectedStandbyCom: true // true -> com1  false -> com2
    property int navVolume: 100
    property bool navVolumeChaned: false
    property int comVolume: 100
    property bool comVolumeChaned: false
    property int modeCDI: 0 // 0 -> GPS  1 -> NAV1  2 -> NAV2
    property real minNavFreq: 108
    property real maxNavFreq: 118
    property real minComFreq: 118
    property real maxComFreq: 136

    width: 1024
    height: 56
    color: "#231f20"
    id:mainRect
    Row
    {
        spacing: 2
        Rectangle
        {
            id: navFrequencyBox
            width: mainRect.width/4
            height: mainRect.height
            color: "#231f20"
            Row{
                id: navTopRow
                Rectangle{
                    color: "Transparent"
                    width: navFrequencyBox.width*(0.5/3.5)*(1+(navVolumeChaned && selectedStandbyNav)*0.5)
                    height: navFrequencyBox.height/2
                    Text
                    {
                        bottomPadding: 4
                        anchors.fill: parent
                        verticalAlignment: Text.AlignBottom
                        horizontalAlignment: Text.AlignHCenter
                        color:"#ffffff"
                        text: (navVolumeChaned && selectedStandbyNav)? "VOLUME": "NAV1"
                        font.pixelSize:12
                        font.bold: true
                    }
                }
                Rectangle{
                    color: "Transparent"
                    width: navFrequencyBox.width*(1/3.5)*(1-(navVolumeChaned && selectedStandbyNav)*0.25)
                    height: navFrequencyBox.height/2
                    border.color: "#00b8f0"
                    border.width: 2*(!navVolumeChaned  && selectedStandbyNav)
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.family: "Franklin Gothic Medium"
                        rightPadding: 3
                        color: (navVolumeChaned && selectedStandbyNav)? "#00b8f0": "#ffffff"
                        text: (navVolumeChaned && selectedStandbyNav)? navVolume+"%": nav1StandbyFrequency.toFixed(2)
                        font.pixelSize:18-(navVolumeChaned  && selectedStandbyNav)*4
                        font.bold: true
                    }
                }
                Rectangle{
                    width: navFrequencyBox.width*(0.5/3.5)
                    height: navFrequencyBox.height/2
                    color: "Transparent"
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: (nav1ID)? "#ffffff" :"#00b8f0"
                        text: (nav1ID)? "ID":(selectedStandbyNav)? "⟷": ""
                        font.pixelSize:18
                        font.bold: true
                    }
                }
                Rectangle{
                    color: "Transparent"
                    width: navFrequencyBox.width*(1/3.5)
                    height: navFrequencyBox.height/2
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        color: (modeCDI === 1)? constColors[1]: "#ffffff"
                        text: nav1ActiveFrequency.toFixed(2)
                        font.pixelSize: 18
                        font.bold: true
                    }
                }
                Rectangle{  /////////////////////  NOT COMPLETED!!!
                    width: navFrequencyBox.width*(0.5/3.5)
                    height: navFrequencyBox.height/2
                    color: "Transparent"
                }
            }
            Row{
                anchors.top: navTopRow.bottom
                Rectangle{
                    color: "Transparent"
                    width: navFrequencyBox.width*(0.5/3.5)*(1+(navVolumeChaned && !selectedStandbyNav)*0.5)
                    height: navFrequencyBox.height/2
                    Text
                    {
                        bottomPadding: 4
                        anchors.fill: parent
                        verticalAlignment: Text.AlignBottom
                        horizontalAlignment: Text.AlignHCenter
                        color:"#ffffff"
                        text: (navVolumeChaned && !selectedStandbyNav)? "VOLUME": "NAV2"
                        font.pixelSize:12
                        font.bold: true
                    }
                }
                Rectangle{

                    color: "Transparent"
                    width: navFrequencyBox.width*(1/3.5)*(1-(navVolumeChaned && !selectedStandbyNav)*0.25)
                    height: navFrequencyBox.height/2
                    border.color: "#00b8f0"
                    border.width: 2*(!navVolumeChaned  && !selectedStandbyNav)
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        rightPadding: 3
                        color: (navVolumeChaned && !selectedStandbyNav)? "#00b8f0": "#ffffff"
                        text: (navVolumeChaned && !selectedStandbyNav)? navVolume+"%": nav2StandbyFrequency.toFixed(2)
                        font.pixelSize:18-(navVolumeChaned  && !selectedStandbyNav)*4
                        font.bold: true
                    }
                }
                Rectangle{
                    width: navFrequencyBox.width*(0.5/3.5)
                    height: navFrequencyBox.height/2
                    color: "Transparent"
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: (nav2ID)? "#ffffff" :"#00b8f0"
                        text: (nav2ID)? "ID":(!selectedStandbyNav)? "⟷": ""
                        font.pixelSize:18
                        font.bold: true
                    }
                }
                Rectangle{
                    color: "Transparent"
                    width: navFrequencyBox.width*(1/3.5)
                    height: navFrequencyBox.height/2
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        color: (modeCDI === 2)? constColors[1]: "#ffffff"
                        text: nav2ActiveFrequency.toFixed(2)
                        font.pixelSize: 18
                        font.bold: true
                    }
                }
                Rectangle{  /////////////////////  NOT COMPLETED!!!
                    width: navFrequencyBox.width*(0.5/3.5)
                    height: navFrequencyBox.height/2
                    color: "Transparent"
                }
            }
        }


        Rectangle
        {
            id: navigationStatusBox
            width: mainRect.width/2
            height: mainRect.height
            color: "#231f20"

//            Text
//            {
//                color:"#ffffff"
//                text:varTempMessage2
//                font.pixelSize:10
//            }


            Rectangle {
                id:rowDivider
                color:"#fff"
                width: mainRect.width/2-1
                height:1/*
                x:parent.x*/
                y:parent.y + parent.height/2
            }
            Rectangle {
                id:leftLine
                color:"#fff"
                width: 1
                height:mainRect.height
                x:0
                y:0
            }
            Rectangle {
                id:rightLine
                color:"#fff"
                width: 1
                height:mainRect.height
                x:navigationStatusBox.width-2
                y:0
            }
        }

        Rectangle
        {
            id: comFrequencyBox
            width: mainRect.width/4
            height: mainRect.height
            color: "#231f20"
            Row{
                id: comTopRow
                Rectangle{
                    color: "Transparent"
                    width: comFrequencyBox.width*(1.2/3.5)
                    height: comFrequencyBox.height/2
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        color: "#ffffff"
                        text: com1ActiveFrequency.toFixed(3)
                        font.pixelSize: 18
                        font.bold: true
                    }
                }
                Rectangle{
                    width: comFrequencyBox.width*(0.5/3.5)
                    height: comFrequencyBox.height/2
                    color: "Transparent"
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "#00b8f0"
                        text: (selectedStandbyCom)? "⟷": ""
                        font.pixelSize:18
                        font.bold: true
                    }
                }
                Rectangle{
                    color: "Transparent"
                    width: comFrequencyBox.width*(1.2/3.5)*(1-(comVolumeChaned && selectedStandbyCom)*0.25)
                    height: comFrequencyBox.height/2
                    border.color: "#00b8f0"
                    border.width: 2*(!comVolumeChaned  && selectedStandbyCom)
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        rightPadding: 3
                        color: (comVolumeChaned && selectedStandbyCom)? "#00b8f0": "#ffffff"
                        text: (comVolumeChaned && selectedStandbyCom)? comVolume+"%": com1StandbyFrequency.toFixed(3)
                        font.pixelSize:18-(comVolumeChaned  && selectedStandbyCom)*4
                        font.bold: true
                    }
                }
                Rectangle{
                    color: "Transparent"
                    width: comFrequencyBox.width*(0.6/3.5)*(1+(comVolumeChaned && selectedStandbyCom)*0.5)
                    height: comFrequencyBox.height/2
                    Text
                    {
                        bottomPadding: 4
                        anchors.fill: parent
                        verticalAlignment: Text.AlignBottom
                        horizontalAlignment: Text.AlignHCenter
                        color:"#ffffff"
                        text: (comVolumeChaned && selectedStandbyCom)? "VOLUME": "COM1"
                        font.pixelSize:12
                        font.bold: true
                    }
                }
            }
            Row{
                anchors.top: comTopRow.bottom
                Rectangle{
                    color: "Transparent"
                    width: comFrequencyBox.width*(1.2/3.5)
                    height: comFrequencyBox.height/2
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        color: "#ffffff"
                        text: com2ActiveFrequency.toFixed(3)
                        font.pixelSize: 18
                        font.bold: true
                    }
                }
                Rectangle{
                    width: comFrequencyBox.width*(0.5/3.5)
                    height: comFrequencyBox.height/2
                    color: "Transparent"
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "#00b8f0"
                        text: (!selectedStandbyCom)? "⟷": ""
                        font.pixelSize:18
                        font.bold: true
                    }
                }
                Rectangle{
                    color: "Transparent"
                    width: comFrequencyBox.width*(1.2/3.5)*(1-(comVolumeChaned && !selectedStandbyCom)*0.25)
                    height: comFrequencyBox.height/2
                    border.color: "#00b8f0"
                    border.width: 2*(!comVolumeChaned  && !selectedStandbyCom)
                    Text
                    {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        rightPadding: 3
                        color: (comVolumeChaned && !selectedStandbyCom)? "#00b8f0": "#ffffff"
                        text: (comVolumeChaned && !selectedStandbyCom)? comVolume+"%": com2StandbyFrequency.toFixed(3)
                        font.pixelSize:18-(comVolumeChaned  && !selectedStandbyCom)*4
                        font.bold: true
                    }
                }
                Rectangle{
                    color: "Transparent"
                    width: comFrequencyBox.width*(0.6/3.5)*(1+(comVolumeChaned && !selectedStandbyCom)*0.5)
                    height: comFrequencyBox.height/2
                    Text
                    {
                        bottomPadding: 4
                        anchors.fill: parent
                        verticalAlignment: Text.AlignBottom
                        horizontalAlignment: Text.AlignHCenter
                        color:"#ffffff"
                        text: (comVolumeChaned && !selectedStandbyCom)? "VOLUME": "COM2"
                        font.pixelSize:12
                        font.bold: true
                    }
                }
            }

        }
    }
}

