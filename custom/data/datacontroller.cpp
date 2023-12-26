#include "datacontroller.h"
StationaryPFD_St_t StationaryPFD_St;

DataController::DataController(QObject *parent)
    : QObject{parent}, tcpClient{new TcpClient}
{
    tcpClient->Init("127.0.0.1", 3000, dataReciever);
    connect(tcpClient, &TcpClient::recievedData, this, [this]() {
        emit dataRecievedChanged();
    });
}
int DataController::modeEIS() const
{
    return m_modeEIS;
}

void DataController::setModeEIS(int newModeEIS)
{
    if (m_modeEIS == newModeEIS)
        return;
    m_modeEIS = newModeEIS;
    emit modeEISChanged(newModeEIS);
}
