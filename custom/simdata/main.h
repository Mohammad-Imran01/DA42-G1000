#ifndef MAIN_H
#define MAIN_H
//#include "TCP_CLIENT_QT/tcpclient.h"


#pragma pack(1)
struct StationaryPFD_St_t {
    quint16 PacketID_u8;
    quint16 PacketSize_u8;

    double pitch_64=0;//"PLANE HEADING DEGREES TRUE", "Degrees"
    double yaw_64=0;//"Plane Pitch Degrees", "degrees"
    double roll_64=0;//"Plane Bank Degrees", "degrees"


    double varIndicatedAirSpeed=0;//AIRSPEED INDICATED", "Knots", FLOAT64
    double varIndicatedAltitude=0;//INDICATED ALTITUDE", "Feet", FLOAT64
    double varVerticalSpeed=0;//VERTICAL SPEED", "Feet per second", FLOAT64

    double varEngineLoad1=0;//GENERAL ENG THROTTLE LEVER POSITION:1", "Percent", FLOAT64
    double varEngineLoad2=0;//GENERAL ENG THROTTLE LEVER POSITION:2", "Percent", FLOAT64

    double varRPM1=0;//PROP1 RPM", "RPM", FLOAT64
    double varRPM2=0;//PROP2 RPM", "RPM", FLOAT64

    double varFuelQtyVal1= 0.0;//RECIP ENG RADIATOR TEMPERATURE:1", "Celsius", FLOAT64
    double varFuelQtyVal2= 0.0;//RECIP ENG RADIATOR TEMPERATURE:2", "Celsius", FLOAT64

    double varOilPresVal1= 0.0;//FUEL TANK LEFT MAIN QUANTITY", "Gallons", FLOAT64
    double varOilPresVal2= 0.0;//FUEL TANK RIGHT MAIN QUANTITY", "Gallons", FLOAT64


    double varCoolantTempVal1= 0.0;//GENERAL ENG1 OIL PRESSURE", "Pounds per square foot", FLOAT64
    double varCoolantTempVal2= 0.0;//GENERAL ENG2 OIL PRESSURE", "Pounds per square foot", FLOAT64

    double varOilTempVal1= 0.0;//GENERAL ENG OIL TEMPERATURE:1", "Celsius", FLOAT64
    double varOilTempVal2= 0.0;//GENERAL ENG OIL TEMPERATURE:2", "Celsius", FLOAT64

    double varFuelFlowVal1=0;//ENG1 FUEL FLOW GPH", "Gallons per hour", FLOAT64
    double varFuelFlowVal2=0;//ENG2 FUEL FLOW GPH", "Gallons per hour", FLOAT64

    double varVolts=0.0;
    double varLoadAmps=0.0;

    double x=0;
    double y=0;

    double xw=0;
    double yw=0;
};
#pragma pack() // Reset packing to default
extern StationaryPFD_St_t StationaryPFD_St;


#endif // MAIN_H
