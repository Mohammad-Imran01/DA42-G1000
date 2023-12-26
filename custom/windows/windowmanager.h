#ifndef WINDOWMANAGER_H
#define WINDOWMANAGER_H

#include "pfdwindow.h"
#include "mfdwindow.h"
#include "../data/datacontroller.h"

#include <QObject>

class WindowManager : public QObject
{
    Q_OBJECT
public:
    explicit WindowManager(MainWindow* mainWindow_, QObject *parent = nullptr);
    ~WindowManager();

    void showWindow(int control=2);
private:
    MainWindow* mainWindow = nullptr;
    DataController* dataController = nullptr;

    MFDWindow* mfdWindow = nullptr;
    PFDWindow* pfdWindow = nullptr;
};

#endif // WINDOWMANAGER_H
