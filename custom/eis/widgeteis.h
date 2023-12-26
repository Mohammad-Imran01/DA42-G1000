#ifndef WIDGETEIS_H
#define WIDGETEIS_H

#include <QWidget>
#include <QQuickWidget>

class WidgetEIS : public QWidget
{
    Q_OBJECT
public:
    explicit WidgetEIS(QWidget *parent = nullptr);
    QQuickWidget* getWidget() const;

signals:

private:
    QQuickWidget* eisWidget = nullptr;
};

#endif // WIDGETEIS_H
