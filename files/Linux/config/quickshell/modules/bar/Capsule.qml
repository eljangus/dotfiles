import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    id: root

    default property alias content: inner.data
    property alias spacing: inner.spacing

    implicitWidth: inner.implicitWidth + Theme.pillMargin * 2 + Theme.pillMarginHorizontal * 2
    radius: Theme.widgetRadius
    color: Theme.surfaceContainer

    RowLayout {
        id: inner

        spacing: 5 // default value, usually overriden

        anchors {
            centerIn: parent
        }

    }

}
