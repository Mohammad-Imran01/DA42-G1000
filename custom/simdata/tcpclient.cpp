#include "tcpclient.h"

struct Hand {
    quint16 Id;
    quint16 DataSize;
} HS_St;



bool TcpClient::Init(const QString  &IpAddress, qint32 PortNum, RecCallback CallbackIn) {
    try {
        TcpPortNum = PortNum;  // Integer for port number
        TcpAddress = IpAddress;  // QHostAddress for IP address
        if(CallbackIn != nullptr){
            CallbackObj = CallbackIn;
        }

        IsInitialized = true;
        IsAsyncConnected = false;
        HSPeriodicityInms = 3000;


        // Initialize the handshake signal
        //        HandShakeSignal.resize(2);
        //        HandShakeSignal[0] = CONAIR_ICD_HS_PACKET_ID;
        //        HandShakeSignal[1] = CONAIR_ICD_HS_PACKET_SIZE;

        //        HandShakeSignal.resize(4);
        //        HandShakeSignal[0] = static_cast<uint8_t>(CONAIR_ICD_HS_PACKET_ID);
        //        HandShakeSignal[2] = static_cast<uint8_t>(CONAIR_ICD_HS_PACKET_SIZE);




        TCP_ClientState_en = TryConnect_en;

        tcpClient = new QTcpSocket(this);
        SendBufMutex = new QMutex();
        RecvBufMutex = new QMutex();
        NetworkThreadObj = new QThread();
        this->moveToThread(NetworkThreadObj);

        QObject::connect(NetworkThreadObj, SIGNAL(started()), this, SLOT(NetworkThread()));
        NetworkThreadObj->start();

    } catch (const std::exception& e) {
        qDebug() << "Exception occurred while initializing network: " << e.what();
        return false;
    }
    return true;
}

void TcpClient::NetworkThread() {
    if(!IsInitialized) {
        qDebug() << "Network not initialized\n";
    }
    bool HSRecieved = false;
    int HSClientNoResCount = 0;

    QDateTime HSPollTime = QDateTime::currentDateTime();

    while (true) {
        if(IsInitialized) {
            switch (TCP_ClientState_en) {
            case TryConnect_en: {
                tcpClient->connectToHost(TcpAddress, TcpPortNum);
                if(tcpClient->waitForConnected(10000)) {
                    HSClientNoResCount = 0;
                    HSRecieved = false;
                    HSPollTime = QDateTime::currentDateTime();
                    StatusChangeCBCalled = false;
                    qDebug() << "Connected to the server!";
                    TCP_ClientState_en = Connected_en;
                } else {
                    qDebug() << "Disconnected! Re-trying to connect...";
                    TCP_ClientState_en = TryConnect_en;
                }
                break;
            }
            case Connected_en: {
                try {
                    if(tcpClient->state() == QAbstractSocket::ConnectedState) {
                        // maintain connection and response time
                        if (HSPollTime.msecsTo(QDateTime::currentDateTime()) > HSPeriodicityInms) {
                            HSPollTime = QDateTime::currentDateTime();
                            if(HSClientResponded){
                                HSClientNoResCount=0;
                            }
                            else{
                                ++HSClientNoResCount;
                            }
                            HSClientResponded = false;
                        }
                        // data
                        /*
                            if (tcpClient->waitForReadyRead(3000)) {
                                QByteArray RecBuf = tcpClient->readAll();
                                int RecLen = RecBuf.size();
//                                PrintArray(RecBuf);
                                 if (RecLen > 1) {
                                    int Current0thIndex = 0;
                                    if ((RecBuf[1] > 0) && (RecBuf[1] <= RecLen)) {
                                        while (((Current0thIndex + RecBuf[Current0thIndex + 1]) <= RecLen) && (Current0thIndex + RecBuf[Current0thIndex + 1]) > 0) {
                                            try {
                                                QByteArray SinglePacket(RecBuf.mid(Current0thIndex, RecBuf[Current0thIndex + 1]));
//                                                qDebug() << SinglePacket;
                                                if (SinglePacket[0] == CONAIR_ICD_HS_PACKET_ID) {
                                                    HSClientResponded = true;
                                                    AddToSendBuffArray(SinglePacket);
                                                } else {
                                                    if (CallbackObj) {
                                                        CallbackObj(SinglePacket);
                                                    }
                                                }
                                                Current0thIndex += RecBuf[Current0thIndex + 1];
                                                if ((RecBuf[Current0thIndex + 1] < 1) || (RecBuf[Current0thIndex + 1] > RecLen)) {
                                                    break;
                                                }
                                            } catch (const std::exception &e) {
                                                qDebug() << "Exception while parsing incoming message: " << e.what();

                                                if (Current0thIndex < RecLen) {
                                                    Current0thIndex += RecBuf[Current0thIndex + 1];
                                                } else {
                                                    break;
                                                }
                                            }
                                        }
                                    } else {
                                        qDebug() << "Invalid Data Received, Rec Len: " << RecLen;
                                        PrintArray(RecBuf);
                                    }
                                }

                            }
                            */
                        // data optimized...
                        if (tcpClient->waitForReadyRead(3000)) {
                            QByteArray RecBuf = tcpClient->readAll();

                            if (RecBuf.size() >= 4) {
                                memcpy(&HS_St, RecBuf.constData(), sizeof(4));

                                if (HS_St.Id == CONAIR_ICD_HS_PACKET_ID && HS_St.DataSize == CONAIR_ICD_HS_PACKET_SIZE) { //222

                                    //                                    qDebug() << "Writing back: " << HS_St.Id << ", " << HS_St.DataSize;
                                    HSClientResponded = true;
                                    AddToSendBuffArray(RecBuf);
                                } else {

                                    if (CallbackObj) {
                                        CallbackObj(RecBuf);
                                        emit recievedData();
                                    }
                                }
                            } else {
                                qDebug() << "Data Received is invalid. Size: " << RecBuf.size();
                            }
                        }


                        // response to be send
                        if (SendBuffArray.isEmpty() == false) {
                            SendBufMutex->lock();
                            try {
                                tcpClient->write(SendBuffArray.first());
                                tcpClient->flush();
                                SendBuffArray.removeFirst();
                            } catch (const std::exception& e) {
                                qDebug() << "Exception in Writing back: " << e.what() << "\n";

                                tcpClient->close();
                                delete tcpClient;
                                tcpClient = new QTcpSocket(this);
                                TCP_ClientState_en = TryConnect_en;
                                qDebug() << "Trying to connect again";
                            }
                            SendBufMutex->unlock();
                        }

                        // if reponse time exceeded connect again
                        if (HSClientNoResCount > HSFailMaxCount) {
                            qDebug() << "Server didn't received for 10sec, trying to connect back\n";
                            tcpClient->close();
                            delete tcpClient;
                            tcpClient = new QTcpSocket(this);
                            TCP_ClientState_en = TryConnect_en;
                        }
                    } else {
                        tcpClient->close();
                        delete tcpClient;
                        tcpClient = new QTcpSocket(this);
                        StatusChangeCBCalled = false;

                        qDebug() << "Connectionlost: Trying to connect again\n";
                        TCP_ClientState_en = TryConnect_en;
                    }
                } catch (const std::exception& ex) {
                    TCP_ClientState_en = TryConnect_en;
                    StatusChangeCBCalled = false;
                    if (tcpClient->state() != QAbstractSocket::UnconnectedState) {
                        tcpClient->close();
                    }
                    delete tcpClient;
                    tcpClient = new QTcpSocket(this);
                    qDebug() << "Started listening again Exception: " << ex.what();
                }
                //                QThread::msleep(1000);
                break;
            }
            case Disconnect_en: {
                if (tcpClient->state() != QAbstractSocket::UnconnectedState) {
                    tcpClient->close();
                }
                delete tcpClient;
                delete SendBufMutex;
                delete RecvBufMutex;
                delete NetworkThreadObj;
                break;
            }
            }
        } else if (TCP_ClientState_en == TryConnect_en) {
            qDebug() << "Sleeping 50ms\n";
            QThread::msleep(50);
        } else {
            qDebug() << "Sleeping 10ms\n";
            QThread::msleep(10);
        }
    }
}

void TcpClient::PrintArray(const QByteArray &PrintArray) {
    int Count0 = 0;

    for (int i = 0; i < PrintArray.size(); i++) {
        if (PrintArray.at(i) == 0) {
            Count0++;
        } else {
            Count0 = 0;
        }

        std::cout << static_cast<int>(PrintArray.at(i)) << " ";

        if (Count0 > 15) {
            break;
        }
    }

    qDebug() << "\n";
}

void TcpClient::AddToSendBuff(const qint8& BytesIn)
{
    SendBufMutex->lock();
    SendBuff.append(BytesIn);
    SendBufMutex->unlock();
}

void TcpClient::AddToSendBuffArray(const QByteArray& ByteListIn)
{
    SendBufMutex->lock();
    SendBuffArray.append(ByteListIn);
    SendBufMutex->unlock();
}
