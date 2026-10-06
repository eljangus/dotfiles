import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Capsule {
    id: root

    property string screenName
    property real dotSize: root.height / 4
    property real dotGap: (root.height - dotSize) / 2
    property real dotMargin: dotGap / 2
    property real activeMargin: Math.max(0, Theme.pillMargin - dotGap / 2)

    spacing: 0 // because of my fuckery
    padding: dotGap

    WheelHandler {
        id: scrollWheelWorkspaces

        parent: root
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        orientation: Qt.Vertical
        onWheel: (event) => {
            if (event.angleDelta.y < 0)
                Niri.scrollWorkspaces("FocusWorkspaceDown");

            if (event.angleDelta.y > 0)
                Niri.scrollWorkspaces("FocusWorkspaceUp");

        }
    }

    Repeater {
        model: Niri.workspaces

        Rectangle {
            id: pills

            visible: root.screenName === model.output
            color: model.isUrgent ? Theme.error : mouseAreaPills.containsMouse ? Theme.secondary : model.isActive ? Theme.primary : Theme.textOnSurface
            opacity: (model.isUrgent && model.isActive) ? 1 : model.isUrgent ? 0.5 : model.isActive ? 1 : mouseAreaPills.containsMouse ? 1 : model.isOccupied ? 0.8 : 0.2
            implicitWidth: model.isActive ? wsText.implicitWidth + Theme.pillPaddingActive * 2 : dotSize
            implicitHeight: model.isActive ? root.height - Theme.pillMargin * 2 : dotSize
            radius: Theme.pillRadius
            Layout.leftMargin: model.isActive ? activeMargin : dotMargin
            Layout.rightMargin: model.isActive ? activeMargin : dotMargin

            Text {
                id: wsText

                text: model.name != "" ? model.name : model.idx
                color: Theme.surfaceContainer
                opacity: model.isActive ? 1 : 0
                font.pointSize: model.isActive ? Theme.widgetFontSize : 0

                anchors {
                    centerIn: parent
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 150
                    }

                }

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 80
                    }

                }

            }

            MouseArea {
                id: mouseAreaPills

                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: Niri.focusWorkspace(model.id)
            }

            Behavior on color {
                ColorAnimation {
                    duration: 80
                }

            }

            Behavior on opacity {
                OpacityAnimator {
                    duration: 150
                }

            }

            Behavior on implicitWidth {
                NumberAnimation {
                    duration: 80
                }

            }

            Behavior on Layout.rightMargin {
                NumberAnimation {
                    duration: 10
                }

            }

            Behavior on Layout.leftMargin {
                NumberAnimation {
                    duration: 10
                }

            }

        }

    }

}
