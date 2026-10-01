import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    anchors.left: parent.left
    color: "#2c3148"
    radius: 20
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
                model: niri.workspaces

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
