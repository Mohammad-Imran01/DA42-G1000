#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QDateTime>
#include <QTcpSocket>
#include <QDataStream>
#include <QDebug>
#include <QVector>
#include <QByteArray>
#include <QThread>
#include <QMutex>
#include <iostream>

using RecCallback = void(*)(const QByteArray&);
using NetworkStatusChangeCallback = void(*)(bool);
typedef enum{
    TryConnect_en=0,
    Connected_en,
    Disconnect_en
} TCP_ClientState_en_t;


class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = nullptr) : QObject{parent} {}
    ~TcpClient() {
        delete tcpClient;
        delete SendBufMutex;
        delete RecvBufMutex;
        delete NetworkThreadObj;
    }
    bool Init(const QString &IpAddress, qint32 PortNum, RecCallback CallbackIn);
    void PrintArray(const QByteArray&);
    void AddToSendBuffArray(const QByteArray&);
    void AddToSendBuff(const qint8&);

signals:
    bool recievedData();
public slots:
    void NetworkThread();

private:


    QTcpSocket *tcpClient;
    QThread *NetworkThreadObj;

    QMutex *SendBufMutex;
    QMutex *RecvBufMutex;

    RecCallback CallbackObj = nullptr;
    NetworkStatusChangeCallback NetStatusChangeCBObj = nullptr;

    const int HSFailMaxCount = 3;

    bool IsAsyncCalled = true;
    bool IsAsyncConnected = false;
    bool StatusChangeCBCalled=false;

    int TcpPortNum;  // Integer for port number
    QString TcpAddress="";  // QHostAddress for IP address

    TCP_ClientState_en_t TCP_ClientState_en;
    bool IsInitialized;
    int HSPeriodicityInms;
    QString HSString;

    int HSClientNoResCount;
    bool HSClientResponded;

    QByteArray SendBuff;
    QVector<QByteArray> SendBuffArray;

    QByteArray SendBuf;
    QByteArray RecBuf;

    QByteArray HandShakeSignal;


    const quint16 CONAIR_ICD_HS_PACKET_SIZE = 4; //8 //2
    const quint16 CONAIR_ICD_HS_PACKET_ID = 222; //8
};

#endif // TCPCLIENT_H
