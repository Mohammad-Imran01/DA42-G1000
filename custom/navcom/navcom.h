#ifndef NAVCOM_H
#define NAVCOM_H

#include <QObject>
#include <QQuickWidget>


class NAVCOM : public QObject
{
    Q_OBJECT
public:
    explicit NAVCOM(QObject *parent = nullptr);
    QQuickWidget* navcomWidget = nullptr;

    QQuickWidget* getWidget() {
        return navcomWidget;
    }
signals:
};

#endif // NAVCOM_H
