import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Rectangle {
    id: root

    property string screenName

    implicitWidth: row.implicitWidth + Theme.pillMargin * 2
    radius: Theme.widgetRadius
    color: Theme.surfaceContainer

    RowLayout {
        id: row

        spacing: 5

        anchors {
            centerIn: parent
        }

        Repeater {
            model: Niri.workspaces

            Rectangle {
                id: pills

                visible: root.screenName === model.output
                color: model.isUrgent ? Theme.error : mouseAreaPills.containsMouse ? Theme.secondary : model.isActive ? Theme.primary : Theme.outline
                opacity: model.isUrgent ? 1 : model.isActive ? 1 : mouseAreaPills.containsMouse ? 1 : model.isOccupied ? 1 : 0.3
                implicitWidth: model.isActive ? wsText.implicitWidth + Theme.pillPaddingActive * 2 : wsText.implicitWidth + Theme.pillPaddingInactive * 2
                implicitHeight: root.height - Theme.pillMargin * 2
                radius: Theme.pillRadius

                Text {
                    id: wsText

                    text: model.name != "" ? model.name : model.idx
                    color: model.isActive ? Theme.surfaceContainer : Theme.textOnSurface
                    opacity: model.isActive ? 1 : 0
                    font.pointSize: Theme.widgetFontSize

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
                            duration: 150
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
