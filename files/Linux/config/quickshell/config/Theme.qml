import QtQuick
import Quickshell
pragma Singleton

Singleton {
    readonly property color background: "#1a1b26"
    readonly property color foreground: "#c0caf5"
    readonly property color surfaceContainerLow: "#1e202e"
    readonly property color surfaceContainer: "#24283b"
    readonly property color primary: "#7aa2f7"
    readonly property color inactiveForeground: "#1f2130"
    readonly property real fontSize: 14
    readonly property real widgetFontSize: 12
    readonly property real widgetCapsuleRadius: barRadius - barPadding
    readonly property real pillCapsuleRadius: widgetCapsuleRadius - pillMargin
    readonly property real pillPaddingActive: 15
    readonly property real pillMargin: 6
    readonly property real pillPaddingInactive: 4
    readonly property real barRadius: 20
    readonly property real barHeight: 42
    readonly property real barPadding: 6
    readonly property real panelMargin: 10
}
