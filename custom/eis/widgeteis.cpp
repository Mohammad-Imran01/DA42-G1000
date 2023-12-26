#include "widgeteis.h"

WidgetEIS::WidgetEIS(QWidget *parent)
    : QWidget(parent),
    eisWidget(new QQuickWidget)
{
    eisWidget->setObjectName("MfdWidgetLeft");
    eisWidget->setGeometry(QRect(0, 57, 150, 683));
    eisWidget->setSource(QUrl("qrc:/custom/qml/EIS/EIS.qml"));
}

QQuickWidget* WidgetEIS::getWidget() const
{
    return eisWidget;
}
