import QtQuick
import qs.config

Capsule {
    id: root

    Rectangle {
        color: "transparent"
        implicitHeight: twink.implicitHeight
        implicitWidth: twink.implicitWidth

        Text {
            id: twink

            text: "Twinkshell Uwaaa"
            font.pointSize: Theme.widgetFontSize
            font.family: Theme.fontFamily
            color: Theme.textOnSurface
            anchors.centerIn: parent
        }
    }
}
