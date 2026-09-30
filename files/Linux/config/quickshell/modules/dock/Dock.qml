import Quickshell
import Quickshell.Widgets
import QtQuick
import qs.config

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData
      visible: true
      exclusionMode: ExclusionMode.Normal
      exclusiveZone: 0
      color: "transparent"

      implicitHeight: rectangle.implicitHeight

      anchors {
        bottom: true
        left: true
        right: true
      }

      ClippingRectangle {
        id: dock
        bottomRightRadius: -20
        contentInsideBorder: true
        implicitHeight: 100
        anchors.fill: parent
        color: Theme.background
      }

      margins {
        bottom: 10
        left: 700
        right: 700
      }


      Text {
        color: Theme.foreground
        font.pointSize: 30
        anchors.centerIn: parent
        text: "Dock"
      }
    }
  }
}
