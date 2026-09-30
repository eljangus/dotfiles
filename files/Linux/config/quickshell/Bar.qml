import Quickshell
import QtQuick
import "widgets"

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      color: "#1a1b26"

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 40

      ClockWidget {
        font.pointSize: 14
        color: "#c0caf5"
        anchors {
          verticalCenter: parent.verticalCenter
          right: parent.right
          margins: 10
        }
      }
    }
  }
}
