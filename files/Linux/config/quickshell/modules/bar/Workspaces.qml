import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Rectangle {
    id: root

    property string screenName

    implicitWidth: row.implicitWidth + Theme.pillMargin * 3.5
    radius: Theme.widgetRadius
    color: Theme.surfaceContainer

    WheelHandler {
        id: scrollWheelWorkspaces

        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        orientation: Qt.Vertical
        onWheel: (event) => {
            if (event.angleDelta.y < 0)
                Niri.scrollWorkspaces("FocusWorkspaceDown");

            if (event.angleDelta.y > 0)
                Niri.scrollWorkspaces("FocusWorkspaceUp");

        }
    }

    RowLayout {
        id: row

        spacing: 8

        anchors {
            centerIn: parent
        }

        Repeater {
            model: Niri.workspaces

            Rectangle {
                id: pills

                visible: root.screenName === model.output
                color: model.isUrgent ? Theme.error : mouseAreaPills.containsMouse ? Theme.secondary : model.isActive ? Theme.primary : Theme.textOnSurface
                opacity: (model.isUrgent && model.isActive) ? 1 : model.isUrgent ? 0.5 : model.isActive ? 1 : mouseAreaPills.containsMouse ? 1 : model.isOccupied ? 0.8 : 0.2
                implicitWidth: model.isActive ? wsText.implicitWidth + Theme.pillPaddingActive * 2 : wsText.implicitWidth
                implicitHeight: model.isActive ? root.height - Theme.pillMargin * 2 : root.height - Theme.pillMargin * 3.5
                radius: Theme.pillRadius

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
                        duration: 150
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

            }

        }

    }

}
