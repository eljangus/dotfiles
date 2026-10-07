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

    property bool isRipplePressed: false
    required property real rootRadius
    property real circleDiameter: Math.max(root.topLeftCorner, root.bottomLeftCorner, root.topRightCorner, root.bottomRightCorner) * 2
    property real topLeftCorner: Math.hypot(root.posX - 0, posY - 0)
    property real bottomLeftCorner: Math.hypot(root.posX - 0, posY - root.height)
    property real topRightCorner: Math.hypot(root.posX - root.width, posY - 0)
    property real bottomRightCorner: Math.hypot(root.posX - root.width, root.posY - root.height)
    property real posX
    property real posY

    function rippleAnimatePressed(x, y) {
        if (!root.isRipplePressed) {
            root.posX = x;
            root.posY = y;
            root.isRipplePressed = true;
            releaseAnim.stop();
            pressAnim.restart();
            growAnim.restart();
        }
    }

    function rippleAnimateReleased() {
        if (root.isRipplePressed) {
            pressAnim.stop();
            releaseAnim.start();
            root.isRipplePressed = false;
        }
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

        width: root.circleDiameter
        height: root.circleDiameter
        color: Theme.surfaceContainerHighest
        x: root.posX - (width / 2)
        y: root.posY - (height / 2)
        radius: Math.max(width, height) * 0.5
        opacity: 0

        NumberAnimation {
            id: growAnim
            target: ripple
            easing.type: Easing.OutQuart
            property: "scale"
            from: 0
            to: 1
            duration: Theme.rippleDurationScalePress
        }

        NumberAnimation {
            id: pressAnim
            target: ripple
            properties: "opacity"
            from: 0
            to: Theme.rippleOpacity
            duration: Theme.rippleDurationOpacityPress
        }
        NumberAnimation {
            id: releaseAnim
            target: ripple
            easing.type: Easing.InQuart
            properties: "opacity"
            to: 0
            duration: Theme.rippleDurationOpacityRelease
        }
    }
}
