import QtQuick
import qs.config
import qs.services

Capsule {
    id: root

    property string screenName
    property real dotSize: root.height / 4
    property real activePillWidth: Theme.pillPaddingActive * 2
    property real railGap: (root.height - rail.implicitHeight) / 2
    property real dotMargin: (railGap + rail.width / 2 - dotSize / 2) / 2
    property real dotSlot: dotMargin * 2 + dotSize
    property real rowWidth: (Niri.largestIdx[root.screenName]) * dotSlot + edgePadding * 2
    property real edgePadding: railGap + (rail.width - dotSlot) / 2

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

    Rectangle {
        id: rail

        parent: root
        implicitWidth: root.activePillWidth
        implicitHeight: root.height - Theme.pillMargin
        y: (root.height - implicitHeight) / 2
        x: (Niri.activeIdx[root.screenName] - 1) * root.dotSlot + root.dotMargin + root.edgePadding - rail.width / 2 + root.dotSize / 2
        radius: Theme.pillRadius
        color: Theme.primary

        Behavior on x {
            NumberAnimation {
                duration: 170
                easing.type: Easing.OutCubic
            }
        }
        Text {
            id: wsText

            text: Niri.activeName[root.screenName] ? Niri.activeName[root.screenName] : Niri.activeIdx[root.screenName]
            color: Theme.surfaceContainer
            font.pointSize: Theme.widgetFontSize

            anchors {
                centerIn: parent
            }
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
            x: (model.idx - 1) * root.dotSlot + root.dotMargin + root.edgePadding
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
                cursorShape: model.isActive ? Qt.ArrowCursor : Qt.PointingHandCursor
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
        }
    }
}
