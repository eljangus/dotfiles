import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import qs.components
import qs.config

Item {
    id: root

    default property alias content: inner.data
    property alias spacing: inner.spacing
    property real padding: Theme.capsulePadding * 2 + Theme.capsulePaddingHorizontal * 2

    implicitWidth: inner.implicitWidth + root.padding
    Layout.fillHeight: true

    RectangularShadow {
        anchors.fill: capsule
        antialiasing: true
        blur: Theme.shadowBlur
        bottomLeftRadius: Theme.capsuleRadius
        bottomRightRadius: Theme.capsuleRadius
        topLeftRadius: Theme.capsuleRadius
        topRightRadius: Theme.capsuleRadius
        offset: Theme.shadowOffset
        spread: Theme.shadowSpread
        color: Qt.alpha(Theme.shadowColor, 0.6)
    }

    Rectangle {
        id: capsule

        anchors.fill: root
        radius: Theme.capsuleRadius
        color: hoverHandler.hovered ? Theme.surfaceContainerHigh : Theme.surfaceContainer

        HoverHandler {
            id: hoverHandler
        }

        MouseArea {
            id: clickArea

            onPressed: {
                ripple.rippleAnimate(mouseX, mouseY);
            }
            anchors.fill: parent
        }

        Ripple {
            id: ripple

            rootRadius: Theme.capsuleRadius
            anchors.fill: parent
        }

        RowLayout {
            id: inner

            spacing: 5 // default value, usually overriden

            anchors {
                centerIn: capsule
            }
        }

        layer.effect: MultiEffect {
            maskSource: ripple
            maskEnabled: true
            maskInverted: true
            maskThresholdMin: 0.5
            maskSpreadAtMin: 1
            autoPaddingEnabled: false
        }

        Behavior on color {
            ColorAnimation {
                duration: 150
            }
        }
    }
}
