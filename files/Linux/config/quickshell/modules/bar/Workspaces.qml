import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Rectangle {
    anchors.left: parent.left
    color: "transparent"
    implicitHeight: 25
    implicitWidth: 200

    Rectangle {
        id: workspaceLayout

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
            margins: 10
        }

        RowLayout {
            spacing: 5

            anchors {
                verticalCenter: parent.verticalCenter
            }

            Repeater {
                model: Niri.workspacesList

                Text {
                    visible: true
                    text: "O"
                    width: 15
                    height: 15
                    color: Theme.foreground
                    font.pointSize: Theme.fontSize

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }

                }

            }

        }

    }

}
