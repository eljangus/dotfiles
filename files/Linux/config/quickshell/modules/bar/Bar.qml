import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar

            required property var modelData

            screen: modelData
            color: "transparent"
            implicitHeight: rectangle.implicitHeight

            anchors {
                top: true
                left: true
                right: true
            }

            ClippingRectangle {
                id: rectangle

                bottomRightRadius: -20
                contentInsideBorder: true
                implicitHeight: 40
                anchors.fill: parent
                color: Theme.background
            }

            RowLayout {
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    margins: 0
                }

                Workspaces {
                    id: workspaces
                }

            }

            Rectangle {
                color: "transparent"
                implicitHeight: twink.implicitHeight
                implicitWidth: twink.implicitWidth

                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    margins: 10
                }

                Text {
                    id: twink

                    text: "Twinkshell Uwaaa"
                    font.pointSize: Theme.fontSize
                    color: Theme.foreground
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        for (var i = 0; i < Niri.workspacesIdk.length; i++) {
                            console.log(Niri.workspaces.get(i));
                        }
                    }
                }

            }

            Clock {
                anchors.centerIn: parent
            }

        }

    }

}
