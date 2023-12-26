#ifndef MFDWINDOW_H
#define MFDWINDOW_H


#include "../eis/widgeteis.h"
#include "../navcom/navcom.h"
#include "../softkeys/mfdsoftkey.h"
#include "../data/datacontroller.h"

#include "../../src/app/navapp.h"
#include "../../src/mapgui/mapwidget.h"
#include "../../src/mapgui/mapthemehandler.h"
#include "../../src/mapgui/mapdetailhandler.h"

#include <QVector>
#include <QActionGroup>
#include <QAction>
#include <QMainWindow>
#include <QVBoxLayout>
#include <QHBoxLayout>

#include <QQuickItem>
#include <QMetaObject>
#include <QQmlProperty>
#include <QQmlContext>

#include <iomanip>
#include <QQmlEngine>
#include <QWidget>

class MainWindow;

namespace Ui {
class MFDWindow;
}

class MFDWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MFDWindow(MainWindow* mainWindow_, DataController* dataController_, QWidget *parent = nullptr);
    ~MFDWindow();


private:
    Ui::MFDWindow *ui;
    Ui::MainWindow* mainUi;
    MainWindow* mainWindow = nullptr;
    DataController* dataController = nullptr;
    MapWidget* mapWidget = nullptr;
    MapThemeHandler* mapthemeHandler = nullptr;
    MapDetailHandler* mapDetailHandler = nullptr;
    QActionGroup* mapThemeActionGroup = nullptr;

    NAVCOM* navcom = nullptr;
    WidgetEIS* eis = nullptr;
    MfdSoftKey* mfdsoftKey = nullptr;
    QQuickWidget* eisWidget = nullptr;
    QQuickItem* eisRootItem = nullptr;

    QVBoxLayout* mainLayout = nullptr;
    QHBoxLayout* midLayout = nullptr;

    //setsPrecision
    double toFixed(double value, int precision) {
        std::ostringstream oss;
        oss << std::fixed << std::setprecision(precision) << value;
        return std::stod(oss.str());
    }
    // Receives QActionGroup, returns the marked index
    int getMarkedIndex(QActionGroup* actionGroup) {
        if (actionGroup) {
            QAction* checkedAction = actionGroup->checkedAction();
            if (checkedAction) {
                // Get the index of the checked action within the action group
                return actionGroup->actions().indexOf(checkedAction);
            }
        }
        // No action is checked or invalid action group
        return -1;
    }
    // Takes an array, marks indices in the array
    void markIndex(QActionGroup* actionGroup, const QVector<int>& indicesToMark) {
        if (actionGroup) {
            unCheckQAction(actionGroup);
            // Mark new indices
            for (int index : indicesToMark) {
                if (index >= 0 && index < actionGroup->actions().size()) {
                    actionGroup->actions().at(index)->setChecked(true);
                }
            }
        }
    }
    // Takes an integer, marks the index
    void markIndex(QActionGroup* actionGroup, int indexToMark) {
        if (actionGroup) {
            // Mark the specified index
            if (indexToMark >= 0 && indexToMark < actionGroup->actions().size()) {
                actionGroup->actions().at(indexToMark)->setChecked(true);
            }
        }
    }
    // Unmark all marked actions
    void unCheckQAction(QActionGroup* actionGroup) {
        if (actionGroup) {
            for (QAction* action : actionGroup->actions()) {
                if (action && action->isChecked()) {
                    action->setChecked(false);
                }
            }
        }
    }

    void setupUI();
    void connectUI();
    void handleSimData();
    void handleEISMode(int);
    void handleMapTheme();
    void handleDCLRTmode(int newDCLTR);
    void handleTerrainVisible(bool isVisible);
    void handleAirwaysMode(int newMode);
};

#endif // MFDWINDOW_H
