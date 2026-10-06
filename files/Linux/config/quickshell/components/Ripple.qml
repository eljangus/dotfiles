pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects
import qs.config

Item {
    id: root

    layer.enabled: true
    layer.effect: MultiEffect {
        maskEnabled: true
        maskSource: stencil
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1
    }

    property color rippleColor: Theme.rippleColor
    property real rippleDuration: Theme.rippleDuration
    required property real rootRadius
    property real posX
    property real posY

    function rippleAnimate(x, y) {
        root.posX = x;
        root.posY = y;
        rippleAnimation.restart();
    }

    Rectangle {
        id: stencil

        layer.enabled: true
        visible: false
        anchors.fill: parent
        radius: root.rootRadius
    }

    Rectangle {
        id: ripple
        width: 20
        height: 20
        color: "red"
        x: root.posX - (width / 2)
        y: root.posY - (height / 2)
        radius: width + height
        opacity: 0

        ParallelAnimation {
            id: rippleAnimation
            NumberAnimation {
                target: ripple
                property: "scale"
                from: 0
                to: Math.max(root.width, root.height)
                duration: root.rippleDuration
            }
            NumberAnimation {
                target: ripple
                properties: "opacity"
                from: 1
                to: 0
                duration: root.rippleDuration
            }
        }
    }
}
