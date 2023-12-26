#ifndef DATACONTROLLER_H
#define DATACONTROLLER_H

#include <QObject>
#include "../simdata/tcpclient.h"
#include "../simdata/main.h"

class DataController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int modeEIS READ modeEIS WRITE setModeEIS NOTIFY modeEISChanged FINAL)
public:
    explicit DataController(QObject *parent = nullptr);

    int modeEIS() const;
    void setModeEIS(int newModeEIS);
    static void dataReciever(const QByteArray& arr) {
        if (arr.size() != sizeof(StationaryPFD_St_t)) {
            qDebug() << "Callbk :- Received data is not same. Expected: "
                     << sizeof(StationaryPFD_St_t)
                     << " Recieved: " << arr.size();

            qDebug() << "id: "
                     << StationaryPFD_St.PacketID_u8
                     << " size: " << StationaryPFD_St.PacketSize_u8;
            return;
        }

        memcpy(&StationaryPFD_St, arr.constData(), sizeof(StationaryPFD_St_t));
        //    qDebug() << "CB: " << StationaryPFD_St.PacketID_u8 << ", " << StationaryPFD_St.PacketSize_u8;
        qDebug() << "PacketID: " << StationaryPFD_St.PacketID_u8
                 << " PacketSize: " << StationaryPFD_St.PacketSize_u8;
        qDebug() << "Pitch: " << StationaryPFD_St.pitch_64
                 << " Yaw: " << StationaryPFD_St.yaw_64
                 << " Roll: " << StationaryPFD_St.roll_64;

        qDebug() << "Indicated Air Speed: " << StationaryPFD_St.varIndicatedAirSpeed
                 << " Indicated Altitude: " << StationaryPFD_St.varIndicatedAltitude
                 << " Vertical Speed: " << StationaryPFD_St.varVerticalSpeed;

        qDebug() << "load1: " << StationaryPFD_St.varEngineLoad1
                 << " load2: " << StationaryPFD_St.varEngineLoad2;

        qDebug() << "rpm1: " << StationaryPFD_St.varRPM1
                 << " rpm2: " << StationaryPFD_St.varRPM2;

        qDebug() << "fqty1: " << StationaryPFD_St.varFuelQtyVal1
                 << " fqty2: " << StationaryPFD_St.varFuelQtyVal2;

        qDebug() << "opres1: " << StationaryPFD_St.varOilPresVal1
                 << " opres2: " << StationaryPFD_St.varOilPresVal2;

        qDebug() << "ctemp1: " << StationaryPFD_St.varCoolantTempVal1
                 << " ctemp2: " << StationaryPFD_St.varCoolantTempVal2;

        qDebug() << "otemp1: " << StationaryPFD_St.varOilTempVal1
                 << " otemp2: " << StationaryPFD_St.varOilTempVal2;

        qDebug() << "fflow1: " << StationaryPFD_St.varFuelFlowVal1
                 << " fflow2: " << StationaryPFD_St.varFuelFlowVal2;

        qDebug() << "Volts: " << StationaryPFD_St.varVolts
                 << " Load Amps: " << StationaryPFD_St.varLoadAmps;

        qDebug() << "______________________________________";
    }
signals:
    void modeEISChanged(int);
    void dataRecievedChanged();

private:
    int m_modeEIS;

    TcpClient* tcpClient=nullptr;
    bool m_dataRecieved;
};

#endif // DATACONTROLLER_H
