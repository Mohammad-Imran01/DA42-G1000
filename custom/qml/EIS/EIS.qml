import QtQuick 2.9
import QtQuick.Controls 2.5
// import Sim_Data_PFD 1.0

Rectangle
{
    id: containerEIS
    width: 150
    height: 683
    visible: true

    readonly property int totalModeEIS:3
                  property int modeEIS:1

    //  function updateModeEIS(intValue: int) {
    //      console.log("at update mode eis qml")
    //     containerEIS.modeEIS = intValue
    // }

    /// C++ CLASSES ////////

//     Sim_Data_PFD {
//         id:ct
//         onDataChanged: {

//             containerEIS.varEngineLoad1 = ct.eLoad1.toFixed(0);
//             containerEIS.varEngineLoad2 = ct.eLoad2.toFixed(0);

//             containerEIS.varRPM1 = ct.rpm1.toFixed(0);
//             containerEIS.varRPM2 = ct.rpm2.toFixed(0);

//             containerEIS.varFuelFlowVal1 = ct.fuelflow1.toFixed(1);
//             containerEIS.varFuelFlowVal2 = ct.fuelflow2.toFixed(1);

//             containerEIS.varOilTempVal1 = ct.varOilTempVal1.toFixed(0);
//             containerEIS.varOilTempVal2 = ct.varOilTempVal2.toFixed(0);

//             containerEIS.varOilPressVal1 = ct.varOilPresVal1.toFixed(0);
//             containerEIS.varOilPressVal2 = ct.varOilPresVal2.toFixed(0);

//             containerEIS.varCoolantTempVal1 = ct.varCoolantTempVal1.toFixed(0);
//             containerEIS.varCoolantTempVal2 = ct.varCoolantTempVal2.toFixed(0);

//             containerEIS.varGearBVal1 =ct.varCoolantTempVal1.toFixed(0);
//             containerEIS.varGearBVal2 =ct.varCoolantTempVal2.toFixed(0);

//             containerEIS.varFuelTempVal1 = ct.varFuelTempVal1.toFixed(0);
//             containerEIS.varFuelTempVal2 = ct.varFuelTempVal2.toFixed(0);

//             containerEIS.varFuelQtyVal1 = ct.varFuelQtyVal1.toFixed(0);
//             containerEIS.varFuelQtyVal2 = ct.varFuelQtyVal2.toFixed(0);

//             containerEIS.varVoltVal1 = containerEIS.varVoltVal2 = ct.varVolts.toFixed(0);
//             containerEIS.varAmpVal1 = containerEIS.varAmpVal2 = ct.varLoadAmps.toFixed(0);

// //            containerEIS.varGalRemVal  =  (containerEIS.varFuelQtyVal1 + containerEIS.varFuelQtyVal2)

//             containerEIS.varGalUsedVal = containerEIS.constFuelQtyMax*2 - (containerEIS.varFuelQtyVal1 + containerEIS.varFuelQtyVal2)

//             containerEIS.varGalRemVal = containerEIS.varFuelQtyVal1 + containerEIS.varFuelQtyVal2

//             containerEIS.varEndurVal = ((containerEIS.varFuelQtyVal1+containerEIS.varFuelQtyVal2)/
//                         (containerEIS.varFuelFlowVal1+containerEIS.varFuelFlowVal2).toFixed(0)).toFixed(0)
//             containerEIS.varRangeVal = ((containerEIS.varFuelQtyVal1+containerEIS.varFuelQtyVal2)/
//                         (containerEIS.varFuelFlowVal1+containerEIS.varFuelFlowVal2)*containerEIS.varAirspeedValue).toFixed(0)

//         }
//         Component.onCompleted: { updateValues(); }
//     }


    readonly property string constFontFamily:"Franklin Gothic Medium"
    readonly property double widthEISComponent: 150

    readonly property double widthHImg: containerEIS.widthEISComponent - 10
    readonly property double heightHImg: 50
    readonly property double horizontalImg_x: 4.5
    readonly property double horizontalImg_y: 18


    readonly property int constTriangleSize: 17
    readonly property double triangleBegin: 4
    readonly property double trianglePX: 124


    readonly property int scaleNumW: 22
    readonly property int scaleNumH: 16

    readonly property int wordMidX: 62 //EIS middle col (X)

    readonly property int sliderWidth: 13
    readonly property int sliderHeight: 6

    readonly property int smallLeftX: 14    //semi
    readonly property int smallRightX: 110 //semi
    readonly property int leftX: 8     //full
    readonly property int rightX: 118   //full

    readonly property int horizontalEISHeadY: 29

    readonly property int fontSM:12
    readonly property int fontMD:16


    readonly property int componentH1: 130
    readonly property int componentH2: 50
    readonly property int componentH3: 68
    readonly property int componentH4: 95
    readonly property int componentH5: 157

/////////Engine Load /////////
    readonly property int constLoadHeight: containerEIS.componentH1

    readonly property double constELoadValMax: 100.0
    readonly property double constELoadPX: 90.5

    readonly property double constELoadPixelRange:constELoadPX/constELoadValMax

    property double varEngineLoad1:100
    property double varEngineLoad2:0

////////    RPM    //////////
    readonly property int constRPMHeight: containerEIS.constLoadHeight-3

    readonly property double constRPMValMax: 3000.0
    readonly property double constRPMPX: containerEIS.constELoadPX

    readonly property double constRPMPixelRange:constRPMPX/constRPMValMax

    property double varRPM1:0
    property double varRPM2:3000

//EIS1/////// fuel flow /////////
    readonly property int constFuelFlowHeight: 43// containerEIS.componentH2
    property double varFuelFlowVal1:435
    property double varFuelFlowVal2:130

/////////// OIL Temp ////////
    readonly property double constOILTMax: 128.0
    readonly property double constOILTempPixelRange: trianglePX/constOILTMax

    readonly property int constOilTempHeight: containerEIS.componentH3
    property double varOilTempVal1:0
    property double varOilTempVal2:128

/////////// OIL Press ////////
    readonly property double constOILPMax: 128.0
    readonly property double constOILPressPixelRange: trianglePX/constOILPMax

    readonly property int constOilPressHeight: containerEIS.componentH3
    property double varOilPressVal1:128
    property double varOilPressVal2:0

/////////// Coolant Temp ////////
    readonly property double constCoolantTMax: 128.0
    readonly property double constCoolantTPixelRange: trianglePX/constCoolantTMax

    readonly property int constCoolantTempHeight: containerEIS.componentH3
    property double varCoolantTempVal1:0
    property double varCoolantTempVal2:128

/////////// Fuel Temp ////////
    readonly property double constFuelTMax: 128.0
    readonly property double constFuelTPixelRange: trianglePX/constFuelTMax


    readonly property int constFuelTempHeight: containerEIS.componentH3
    property double varFuelTempVal1:128
    property double varFuelTempVal2:0

/////////// Fuel Qty GAL ////////
    readonly property int constFuelQtyHeight: containerEIS.componentH4

    readonly property double constFuelQtyMax: 25.0

    readonly property double constFuelQtyPixelRange: (trianglePX/constFuelQtyMax)

    property double varFuelQtyVal1:25
    property double varFuelQtyVal2:0

    readonly property int labelNumX:0
    readonly property int labelNumY:0

//EIS2/////// ELECTRICAL /////////
    readonly property double constVoltValMax: 40.0
    readonly property double constAmpValMax: 75.0

    readonly property double constVoltPixelRange: trianglePX/constVoltValMax
    readonly property double constAmpPixelRange: trianglePX/constAmpValMax

    readonly property int constElecHeight: containerEIS.componentH5
    property double varVoltVal1: 40
    property double varVoltVal2:0
    property double varAmpVal1:75
    property double varAmpVal2:0

///////// ENGINE /////////
    readonly property double constGearBValMax: 128.0

    readonly property double constGearBPixelRange: trianglePX/constGearBValMax

    readonly property int constEngineHeight: containerEIS.componentH5 - 5
    property double varGearBVal1:128
    property double varGearBVal2:0

///////// OIL /////////
    readonly property double constDFluidMax: 150
    readonly property double constDFluidRange: trianglePX/constDFluidMax

    readonly property int constOilHeight: containerEIS.componentH1-13


    property double varDFluid:0

//EIS3/////// fuel /////////
    readonly property int constFuelHeight: containerEIS.componentH1 - 15

///////// fuel CALC /////////
    readonly property int constFuelCalcHeight: containerEIS.componentH1 + 10

    property double varGalRemVal:0.0
    property double varGalUsedVal:0.0

    property string varEndurVal:"4:52"
    property double varRangeVal:731

///////// TTL SVC Time /////////
    readonly property int constTimeSVCHeight: containerEIS.componentH1
    property string varTimeSVCVal:"0048.0"

//// COMPONENTS /////////
    EISEngineLoad {
        id: mfdEngineLoad
        x:0
        y:0
    }
    EISRPM {
        id: mfdRPM
        x:0
        y:mfdEngineLoad.y + containerEIS.constLoadHeight
    }

    Rectangle {
        id:modeEIS1
        visible: (containerEIS.modeEIS == 1) ? true:false
        EIS1FuelFlow //fuelflow
        {
            id: mfdFuelFlow
            x:0
            y:mfdRPM.y + containerEIS.constRPMHeight
        }
        EIS1OilTemp // Oil temp
        {
            id: mfdOilTemp
            x:0
            y:mfdFuelFlow.y + containerEIS.constFuelFlowHeight
        }
        EIS1OilPress // oil press
        {
            id: oilPress
            x:0
            y:mfdOilTemp.y + containerEIS.constOilTempHeight
        }
        EIS1CoolantTemp // coolantTemp
        {
            id: coolantTemp
            x:0
            y:oilPress.y + containerEIS.constOilPressHeight
        }
        EIS1FuelTemp // Fuel Temp
        {
            id: fuelTemp
            x:0
            y: coolantTemp.y + containerEIS.constCoolantTempHeight
        }
        EIS1FuelQty // Fuel quantity gal
        {
            id: windowFuelQty
            x:0
            y:fuelTemp.y + containerEIS.constFuelTempHeight
        }
        Image
        {
            source: "qrc:/custom/images/BG.png"

            x:0
            y:windowFuelQty.y + windowFuelQty.height
            width: containerEIS.widthEISComponent
            height:689 - (windowFuelQty.y + windowFuelQty.height)
        }

    }
    Rectangle {
        id:modeEIS2
        visible:containerEIS.modeEIS == 2 ? true:false
        EIS2Electrical {
            id:windowElectrical
            x:0
            y:mfdRPM.y + containerEIS.constRPMHeight
        }
        EIS2Engine {
            id:windowEngine
            x:0
            y:windowElectrical.y + containerEIS.constElecHeight
        }
        EIS2Oil {
            id:windowOil
            x:0
            y:windowEngine.y + containerEIS.constEngineHeight
        }
        Image
        {
            source: "qrc:/custom/images/BG.png"

            x:0
            y:windowOil.y + windowOil.height
            width: containerEIS.widthEISComponent
            height:689 - (windowOil.y + windowOil.height)
        }

    }
    Rectangle {
        id:modeEIS3
        visible:containerEIS.modeEIS == 3 ? true:false
        EIS3Fuel {
            id:windowFuel
            x:0
            y:mfdRPM.y + containerEIS.constRPMHeight
        }
        EIS3FuelCalc {
            id:windowFuelCalc
            x:0
            y:windowFuel.y + containerEIS.constFuelHeight
        }
        EIS3timeSVC {
            id:windowTimeSVC
            x:0
            y:windowFuelCalc.y + containerEIS.constFuelCalcHeight
        }
        Image
        {
            source: "qrc:/custom/images/BG.png"

            x:0
            y:windowTimeSVC.y + windowTimeSVC.height
            width: containerEIS.widthEISComponent
            height:containerEIS.height - (windowTimeSVC.y + windowTimeSVC.height)
        }
    }

}
