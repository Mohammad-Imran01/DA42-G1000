import QtQuick 2.12
import QtQuick.Controls 2.12

Label {
    id: label

    property int paramWndType
    property int paramIndex

    readonly property var constColors: [
        Qt.rgba(238/256, 56/256, 56/256, 1), Qt.rgba(95/256, 187/256, 70/256, 1),
        Qt.rgba(0, 185/256, 241/256, 1), Qt.rgba(1, 1, 1, 1), Qt.rgba(35/256, 31/256, 32/256, 1),
        Qt.rgba(255/256, 191/256, 0/256, 1), Qt.rgba(239/256, 89/256, 161/256, 1),
        "Transparent", Qt.rgba(83/256, 54/256, 17/256, 1), Qt.rgba(109/256, 110/256, 112/256, 1),
        Qt.rgba(23/256, 84/256, 274/256, 1)
    ]
    readonly property var constBorderColor: [[4,4,4,4,4],[0,4,4,0,0],[0,4,4,5,0,0,0],[],[0,0,5,4,5,0,0],[0,5,4,5,0,0],[0,4,5,0,0],[],[0,0,5,4,5,0,0],[0,4,5,0,0],[0,0,4,0],[0,4,0],[0,5,4,5,0],[4,4,4,4],[2,2,2],[4,4],[],[0,4,5,0,0],[4,4,4],[4,4],[0,4,0,0],[4,4],[],[],[],[],[],[],[],[],[3,3],[7]]

    readonly property var constBackColor: [
        [4,4,4,4,4], [0,4,4,0,0], [0,4,4,5,0,0,0], [], [0,0,5,4,5,0,0],
        [0,5,4,5,0,0], [0,4,5,0,0], [], [0,0,5,4,5,0,0], [0,4,5,0,0],
        [0,0,4,0], [0,4,0], [0,5,4,5,0], [4,4,4,4], [2,2,2], [4,4], [],
        [0,4,5,0,0], [4,4,4], [4,4], [0,4,0,0], [4,4], [], [], [], [], [], [], [], [], [4,4], [7]
    ]

    readonly property string constFontFamily: "Franklin Gothic Medium"
    readonly property int constLCDW: 320
    readonly property int constLCDH: 240
    readonly property int constFormW: 1024
    readonly property int constFormH: 768
    readonly property int constWidth1: 738
    readonly property int constWidth2: 612
    readonly property double constScalePdfX: (constFormW * 173) / (1185 * 738)
    readonly property double constScalePdfY: (constFormH * 217) / (891 * 932)

    property double varScaleAspectX: constScalePdfX
    property double varScaleAspectY: constScalePdfY
    property double varScaleAspectMin: Math.min(varScaleAspectX, varScaleAspectY)

    readonly property int constDotFont7: 120
    readonly property int constDotFont0: 100
    readonly property int constDotFont1: 80
    readonly property int constDotFont2: 60
    readonly property int constDotBorder: 2
    readonly property int constDotNeighbour: 15
    readonly property int constDotText0: 240
    readonly property int constDotText1: 210
    readonly property int constDotText2: 160
    readonly property int constDotText7: 130
    readonly property int constDotText3: 100
    readonly property var constTextColor:   [[2,2,2,2,2],[3,1,1,3,3],[3,1,1,4,3,3,3],[],[3,3,4,1,4,3,3],[3,4,1,4,3,3],[3,1,4,3,3],[],[3,3,4,1,4,3,3],[3,1,4,3,3],[3,3,1,3],[3,1,3],[3,4,1,4,3],[0,3,5,0],[2,2,2],[3,3],[],[3,1,4,3,3],[1,1,1],[2,2],[3,1,3,3],[2,2],[],[],[],[],[],[],[],[],[2,6],[3]]

    color: constColors[constTextColor[paramWndType][paramIndex]]
    font.family: constFontFamily
    font.pixelSize: varScaleAspectMin * constDotFont1
    font.bold: true

    background: Rectangle {
        id: id1
        color: constColors[constBackColor[paramWndType][paramIndex]]
        border.color: constColors[constBorderColor[paramWndType][paramIndex]]
        border.width: constDotBorder
    }

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}
