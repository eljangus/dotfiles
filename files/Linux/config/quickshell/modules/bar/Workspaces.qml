import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Capsule {
    id: root

    property string screenName
    property real dotSize: root.height / 4
    property real activePillWidth: Theme.pillPaddingActive * 2
    property real dotGap: (root.height - dotSize) / 2
    property real dotMargin: dotGap / 2
    property real dotSlot: dotMargin * 2 + dotSize
    property real wideSlot: activeMargin * 2 + activePillWidth
    property real activeMargin: Math.max(0, Theme.pillMargin)
    property real rowWidth: (Niri.largestIdx[root.screenName] - 1) * dotSlot + wideSlot + dotGap

    spacing: 0 // because of my fuckery
    padding: dotGap

    implicitWidth: rowWidth

    WheelHandler {
        id: scrollWheelWorkspaces

        parent: root
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        orientation: Qt.Vertical
        onWheel: event => {
            if (event.angleDelta.y < 0)
                Niri.scrollWorkspaces("FocusWorkspaceDown");

            if (event.angleDelta.y > 0)
                Niri.scrollWorkspaces("FocusWorkspaceUp");
        }
    }

    Repeater {
        id: dotsRepeater

        // to make sure NOT to use RowLayout
        parent: root
        model: Niri.workspaces

        Rectangle {
            id: pills
            // lord have mercy
            x: (model.idx - 1) * root.dotSlot + (model.idx > Niri.activeIdx[root.screenName] ? root.wideSlot - root.dotSlot : 0) + (model.isActive ? (root.wideSlot - root.dotSize) / 2 : root.dotMargin) + dotGap / 2
            y: (root.height - pills.height) / 2

            TapHandler {
                id: tapWorkspacePills

                enabled: true
                parent: pills
                longPressThreshold: 0
                gesturePolicy: TapHandler.DragThreshold
                onTapped: {
                    Niri.focusWorkspace(model.id);
                }
            }

            HoverHandler {
                id: hoverWorkspacePills

                enabled: parent.enabled
                parent: pills
                // enable blocking to no longer hover the capsule once you hover a pill
                blocking: false
                cursorShape: Qt.PointingHandCursor
            }

            PointHandler {
                id: pointWorkspacePills
            }

            visible: root.screenName === model.output
            color: model.isUrgent ? Theme.error : (hoverWorkspacePills.hovered || pointWorkspacePills.active) ? Theme.secondary : model.isActive ? Theme.primary : Theme.textOnSurface
            opacity: (model.isUrgent && model.isActive) ? 1 : model.isUrgent ? 0.5 : model.isActive ? 1 : (hoverWorkspacePills.hovered || pointWorkspacePills.active) ? 1 : model.isOccupied ? 0.8 : 0.2
            implicitWidth: dotSize
            implicitHeight: dotSize
            radius: Theme.pillRadius
            Layout.leftMargin: model.isActive ? activeMargin : dotMargin
            Layout.rightMargin: model.isActive ? activeMargin : dotMargin

            // Text {
            //     id: wsText

            //     text: model.name != "" ? model.name : model.idx
            //     color: Theme.surfaceContainer
            //     opacity: model.isActive ? 1 : 0
            //     font.pixelSize: model.isActive ? Theme.widgetFontSize : 0

            //     anchors {
            //         centerIn: parent
            //     }

            //     Behavior on color {
            //         ColorAnimation {
            //             duration: 150
            //         }
            //     }

            //     Behavior on opacity {
            //         OpacityAnimator {
            //             duration: 80
            //         }
            //     }
            // }

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
