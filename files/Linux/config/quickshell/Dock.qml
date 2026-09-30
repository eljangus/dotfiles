import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData
      visible: false
      exclusionMode: ExclusionMode.Normal
      exclusiveZone: 0
      
      color: "#1a1b26"

      anchors {
        bottom: true
        left: true
        right: true
      }

      margins {
        bottom: 10
        left: 700
        right: 700
      }

      implicitHeight: 70

      Text {
        color: "#c0caf5"
        font.pointSize: 30
        anchors.centerIn: parent
        text: "Dock" 
      }
    }
  }
}
