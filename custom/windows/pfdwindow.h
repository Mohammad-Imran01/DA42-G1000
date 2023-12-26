// PFDWindow.h
#ifndef PFDWINDOW_H
#define PFDWINDOW_H

#include "../softkeys/pfdsoftkey.h"

#include "../data/datacontroller.h"

#include <QMainWindow>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QQuickWidget>

#include <QQuickItem>
#include <QMetaObject>
#include <QQmlProperty>
#include <QQmlContext>
#include <QQmlEngine>
#include <QWidget>

#include <iomanip>
#include <algorithm>

QT_BEGIN_NAMESPACE
namespace Ui {
class PFDWindow;
}
QT_END_NAMESPACE


class PFDWindow : public QMainWindow
{
    Q_OBJECT
public:
    PFDWindow(DataController* dataController_, QWidget *parent = nullptr);
    ~PFDWindow();

private:
    Ui::PFDWindow *ui;

    // WidgetEIS* eis = nullptr;
    QQuickWidget* pfdMid = nullptr;

    QVBoxLayout* mainLayout = nullptr;

    DataController* dataController = nullptr;
    PFDSoftKey* pfdSoftkeyLayout = nullptr;

    QQuickItem* pfdRootItem = nullptr;

    void setupUI();
    void connectUI();
    void handleSimData();

    double toFixed(double value, int precision) {
        std::ostringstream oss;
        oss << std::fixed << std::setprecision(precision) << value;
        return std::stod(oss.str());
    }
    double clamp(double val, int min, int max) {
        if(val > max) return max;
        if(val < min) return min;
        return val;
    }

};

#endif // PFDWINDOW_H
