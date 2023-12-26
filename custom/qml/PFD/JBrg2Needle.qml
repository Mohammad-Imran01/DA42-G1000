import QtQuick.Shapes 1.12
import QtQuick 2.9

Rectangle{
    property double triangleHeight: 15
    property double margin: 50
    property double rodHeight: 22
    property double rodWidth: 3
    property double arrowAngle: 45
    property double offset: 5
    id: needle
    antialiasing: true
    y: constCompassW/2
    implicitWidth: 2 * triangleHeight
    implicitHeight: constCompassW
    color: constColors[7]
    Rectangle{
        width: rodWidth
        height: triangleHeight + rodWidth
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.top: needle.top
        anchors.topMargin: margin
    }
    Rectangle{
        width: rodWidth
        height: constCompassW / 2 - foregroundCircleDiameter / 2 - margin - triangleHeight - offset
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.horizontalCenterOffset: offset
        anchors.top: needle.top
        anchors.topMargin: margin + triangleHeight + offset
    }
    Rectangle{
        width: rodWidth
        height: constCompassW / 2 - foregroundCircleDiameter / 2 - margin - triangleHeight - offset
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.horizontalCenterOffset: -offset
        anchors.top: needle.top
        anchors.topMargin: margin + triangleHeight + offset
    }
    Rectangle{
        width: rodWidth
        height: rodHeight
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.top: needle.top
        anchors.topMargin: margin + triangleHeight
        transform: Rotation {
            origin.x: 0
            origin.y: 0
            axis { x: 0; y: 0; z: 1 }
            angle: arrowAngle
        }
    }
    Rectangle{
        width: rodWidth
        height: rodHeight
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.top: needle.top
        anchors.topMargin: margin + triangleHeight
        transform: Rotation {
            origin.x: rodWidth
            origin.y: 0
            axis { x: 0; y: 0; z: 1 }
            angle: -arrowAngle
        }
    }


    Rectangle{
        width: rodWidth
        height: triangleHeight
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.bottom: needle.bottom
        anchors.bottomMargin: margin
    }
    Rectangle{
        width: 2 * offset
        height: rodWidth
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.bottom: needle.bottom
        anchors.bottomMargin: margin + triangleHeight
    }
    Rectangle{
        width: rodWidth
        height: constCompassW / 2 - foregroundCircleDiameter / 2 - margin - triangleHeight
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.horizontalCenterOffset: offset
        anchors.bottom: needle.bottom
        anchors.bottomMargin: margin + triangleHeight
    }
    Rectangle{
        width: rodWidth
        height: constCompassW / 2 - foregroundCircleDiameter / 2 - margin - triangleHeight
        color: constColors[2]//lightBlueColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.horizontalCenterOffset: -offset
        anchors.bottom: needle.bottom
        anchors.bottomMargin: margin + triangleHeight
    }

}
