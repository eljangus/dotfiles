import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar

            required property var modelData

            screen: modelData
            color: "transparent"
            implicitHeight: barPanel.implicitHeight

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: Theme.panelMargin
                left: Theme.panelMargin
                right: Theme.panelMargin
            }

            ClippingRectangle {
                id: barPanel

                contentInsideBorder: true
                implicitHeight: Theme.barHeight
                radius: Theme.barRadius
                anchors.fill: parent
                color: Theme.background
            }

            RowLayout {
                id: widgetsLeft

                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    leftMargin: Theme.barPaddingHor
                    rightMargin: Theme.barPaddingHor
                    topMargin: Theme.barPaddingVert
                    bottomMargin: Theme.barPaddingVert
                }

                Workspaces {
                    Layout.fillHeight: true
                    screenName: bar.screen.name
                }

            }

            RowLayout {
                id: widgetsMiddle

                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    leftMargin: Theme.barPaddingHor
                    rightMargin: Theme.barPaddingHor
                    topMargin: Theme.barPaddingVert
                    bottomMargin: Theme.barPaddingVert
                }

                Clock {
                }

            }

            RowLayout {
                id: widgetsRight

                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    leftMargin: Theme.barPaddingHor
                    rightMargin: Theme.barPaddingHor
                    topMargin: Theme.barPaddingVert
                    bottomMargin: Theme.barPaddingVert
                }

                Twinktangle {
                }

            }

        }

    }

}
