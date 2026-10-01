import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
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
                    margins: 10
                }

                Workspaces {
                    id: workspaces
                }

            }

            Text {
                text: "Twinkshell uwaaa"
                font.pointSize: Theme.fontSize
                color: Theme.foreground

                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    margins: 10
                }

            }

            Clock {
                anchors.centerIn: parent
            }

        }

    }

}
