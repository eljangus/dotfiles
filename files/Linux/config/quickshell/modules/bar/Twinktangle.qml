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
            font.pointSize: Theme.fontSize
            color: Theme.textOnSurface
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: console.log("Faggot")
        }

    }

}
