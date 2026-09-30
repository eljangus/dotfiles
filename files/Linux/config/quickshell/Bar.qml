import Quickshell
import Quickshell.Widgets
import QtQuick.Shapes
import QtQuick
import "Widgets"

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      color: "transparent"

      implicitHeight: rectangle.implicitHeight

      ClippingRectangle {
        id: rectangle
        bottomRightRadius: -20
        contentInsideBorder: true
        implicitHeight: 40
        anchors.fill: parent
        color: "#1a1b26"
      }

      Text {
        anchors { 
          right: parent.right
          verticalCenter: parent.verticalCenter
          margins: 10
        }
        text: "Twinkshell uwaaa"
        font.pointSize: 14
        color: "#c0caf5"
      }

      ClockWidget {
        font.pointSize: 14
        color: "#c0caf5"
        anchors {
          verticalCenter: parent.verticalCenter
          centerIn: parent
          margins: 10
        }
      }
    }
  }
}
