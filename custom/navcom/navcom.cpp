#include "navcom.h"

NAVCOM::NAVCOM(QObject *parent)
    : QObject(parent),
    navcomWidget(new QQuickWidget)
{
    navcomWidget->setObjectName("WidgetTop");
    navcomWidget->setGeometry(QRect(0, 0, 1024, 57));
    navcomWidget->setSource(QUrl("qrc:/custom/qml/NAVCOM/NAVCOM.qml"));
}
