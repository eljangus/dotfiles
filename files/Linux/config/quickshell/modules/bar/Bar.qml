import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick
import qs.config

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            color: "transparent"

            implicitHeight: rectangle.implicitHeight

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
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    margins: 10
                }
                text: "Twinkshell uwaaa"
                font.pointSize: Theme.fontSize
                color: Theme.foreground
            }

            Clock {
                anchors.centerIn: parent
            }
        }
    }
}
