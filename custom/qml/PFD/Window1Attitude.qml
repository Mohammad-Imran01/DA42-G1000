import QtQuick.Shapes 1.12
import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/custom/js/public.js" as Jmain

CircularGauge
{
    property double needleWidth: 20

    id: roll_pitch
    width: constAttiW
    height: constAttiW
    minimumValue: -60
    maximumValue: 60
    value: 0
    rotation:varRollValue

    style:
      CircularGaugeStyle
      {
        minorTickmarkCount: 5
        minorTickmarkInset: -outerRadius * 0.07
        tickmarkInset: -outerRadius * 0.14
        tickmarkStepSize: 30
        minimumValueAngle: -60
        maximumValueAngle: 60
        tickmarkLabel: null

        foreground:
        Item
        {
            Rectangle
            {
                id:scaleContainer
                color:constColors[7]

                y:40
                width: constAttiW
                height: constAttiW-94
                layer.enabled:true
                layer.smooth:true
                layer.samples:4
                clip:false

//                border.width:2
//                border.color: "green"


    //            scale
                Rectangle {
                    id:scale
                    width:2*varScaleAspectX*constDotText7 + varScaleAspectX*constPitchW
                    height:constAttiH

//                    border.width:2
//                    border.color: "yellow"

                    anchors.horizontalCenter: parent.horizontalCenter
                    y: varPitchValue*constAttiW/90 - scale.height/2 + 163


                    color:"transparent"

                    clip:false
                    Repeater
                    {
                        model:constPitchLineCount
                        Item
                        {
                            Rectangle
                            {
                                id: myRect
                                antialiasing: true
                                width:varScaleAspectX*constPitchW/((index%4==0)?1:((index%4==2)?2:4))
                                height:constDotBorder
                                y: (constAttiH-23)/constPitchLineCount*index //chera?
                                x:varScaleAspectX*(constDotText7+constPitchW*((index%4==0)?0:(index%4==2)?2:3)/8.0)
                                color:constColors[3]
                                visible: (index%4 != 0 && index%4 != 2) ? false:true
                            }
                        }
                    }
//                  numbers
                    Repeater
                    {
                        model:constPitchTextCount
                        Item
                        {
                            CLabel
                            {
                                id:myLabell
                                paramWndType:31
                                paramIndex:0
                                width:varScaleAspectX*constDotText7
                                font.pixelSize: varScaleAspectMin*constDotFont0
                                x:-5
                                y: (constAttiH-23)/constPitchTextCount*index-myLabell.height/2 //chera?
//                                text: Math.abs(2-index)*10
                                text: Math.abs(Math.floor(constPitchTextCount/2)-index)*10
                                visible: Math.abs(Math.floor(constPitchTextCount/2)-index)*10 != 0 ? true:false
                            }

                            CLabel
                            {
                                id:myLabelr
                                paramWndType:31
                                paramIndex:0
                                width:varScaleAspectX*constDotText7
                                font.pixelSize: varScaleAspectMin*constDotFont0
                                x: varScaleAspectX*(constPitchW+constDotText7)+5
                                y: (constAttiH-23)/constPitchTextCount*index-myLabelr.height/2 //chera?
                                text: Math.abs(Math.floor(constPitchTextCount/2)-index)*10
                                visible: (Math.abs(Math.floor(constPitchTextCount/2)-index)*10) != 0 ? true:false
                            }
                        }
                    }
                }
            }

        }

        tickmark:
           Rectangle
           {
              visible: styleData.value !==0
              width: outerRadius * 0.012
              antialiasing: true
              height: outerRadius * 0.15
              color: constColors[3]
           }
        minorTickmark:
           Rectangle
           {
              visible: (Math.abs(styleData.value) === 45)||(Math.abs(styleData.value) === 20) ||(Math.abs(styleData.value) === 10)
              width: outerRadius * 0.012
              antialiasing: true
              height: outerRadius * 0.08
              color: constColors[3]
           }
        background:
           Canvas
           {
              onPaint:
              {
                 var ctx = getContext("2d");
                 ctx.reset();
                 ctx.beginPath();
                 ctx.strokeStyle = constColors[3];
                 ctx.lineWidth = outerRadius * 0.01;
                 ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                        Jmain.degreesToRadians(valueToAngle(roll_pitch.minimumValue) - 90), Jmain.degreesToRadians(valueToAngle(roll_pitch.maximumValue) - 90));
                 ctx.stroke();
              }
           }
        needle:
           Shape
           {
              layer.enabled: true
              layer.smooth: true
              layer.samples: 4
              id: needle
              width: needleWidth
              height: outerRadius + needle.width
              anchors.centerIn: parent
              ShapePath
              {
                 strokeWidth: 0
                 strokeColor: constColors[3]
                 startX: 0
                 startY: 0
                 fillColor: constColors[3]
                 PathLine { x: needle.width/2; y: needle.width }
                 PathLine { x: needle.width;   y: 0 }
                 PathLine { x: 0;              y: 0 }
              }
           }
     }
}
