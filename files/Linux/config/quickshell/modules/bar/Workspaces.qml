import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Rectangle {
    id: root

    property string screenName

    implicitWidth: row.implicitWidth + Theme.pillMargin * 2
    radius: Theme.widgetCapsuleRadius
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
                visible: root.screenName === model.output
                color: Theme.primary
                opacity: model.isActive ? 1 : 0.4
                implicitWidth: model.isActive ? wsText.implicitWidth + Theme.pillPaddingActive * 2 : wsText.implicitWidth + Theme.pillPaddingInactive * 2
                implicitHeight: root.height - Theme.pillMargin * 2
                radius: Theme.pillCapsuleRadius

                Text {
                    id: wsText

                    text: model.name != "" ? model.name : model.idx
                    color: model.isActive ? Theme.surfaceContainer : Theme.primary
                    opacity: model.isActive ? 1 : 0
                    font.pointSize: Theme.fontSize

                    anchors {
                        centerIn: parent
                    }

                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Niri.focusWorkspace(model.id)
                }

            }

        }

    }

}
