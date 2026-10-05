import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    id: root

    default property alias content: inner.data
    property alias spacing: inner.spacing
    property real padding: Theme.capsulePadding * 2 + Theme.capsulePaddingHorizontal * 2

    implicitWidth: inner.implicitWidth + padding
    radius: Theme.capsuleRadius
    color: Theme.surfaceContainer

    RowLayout {
        id: inner

        spacing: 5 // default value, usually overriden

        anchors {
            centerIn: parent
        }

    }

}
