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
                model: Niri.workspaces

                Rectangle {
                    visible: index < 11
                    width: 15
                    height: 15
                    radius: 10
                    color: model.isActive ? Theme.foreground : Theme.inactiveForeground

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: niri.focusWorkspaceById(model.id)
                    }

                }

            }

        }

    }

}
