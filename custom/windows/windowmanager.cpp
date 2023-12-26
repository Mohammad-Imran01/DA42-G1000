#include "windowmanager.h"
WindowManager::WindowManager(MainWindow* mainWindow_, QObject *parent)
    : QObject{parent},mainWindow{mainWindow_}, dataController{new DataController}
{
}

WindowManager::~WindowManager()
{
    delete pfdWindow;
    delete mfdWindow;

    delete dataController;
}

void WindowManager::showWindow(int control)
{
    delete pfdWindow;
    delete mfdWindow;

    switch (control) {
    case 1:
        pfdWindow = new PFDWindow(dataController);
        pfdWindow->show();
        break;
    case 2:
        pfdWindow = new PFDWindow(dataController);
        pfdWindow->show();
        mfdWindow = new MFDWindow(mainWindow, dataController);
        mfdWindow->show();
        break;
    case 3:
        mfdWindow = new MFDWindow(mainWindow, dataController);
        mfdWindow->show();
        break;
    default:
        break;
    }
}
