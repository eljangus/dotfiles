import QtQuick
import Quickshell
pragma Singleton

Singleton {
    // Colors
    readonly property color background: "#1a1b26"
    readonly property color foreground: "#c0caf5"
    readonly property color surfaceContainerLow: "#1e202e"
    readonly property color surfaceContainer: "#24283b"
    readonly property color primary: "#7aa2f7"
    readonly property color error: "#f7768e"
    readonly property color secondary: "#9ece6a"
    readonly property color inactiveForeground: "#1f2130"
    // Fonts
    readonly property real fontSize: 14
    readonly property real widgetFontSize: 12
    // Bar
    readonly property real barHeight: 42
    readonly property real barRadius: 0
    readonly property real barPaddingHor: 6
    readonly property real barPaddingVert: 6
    readonly property real panelMargin: 0
    // Widgets
    readonly property real widgetRadiusOverride: 20
    readonly property real widgetRadius: widgetRadiusOverride >= 0 ? widgetRadiusOverride : Math.max(0, barRadius - barPaddingVert)
    // Pills (items inside a widget)
    readonly property real pillRadiusOverride: barHeight
    readonly property real pillRadius: pillRadiusOverride >= 0 ? pillRadiusOverride : Math.max(0, widgetRadius - pillMargin)
    readonly property real pillMargin: 6
    readonly property real pillPaddingActive: 4 * pillPaddingInactive
    readonly property real pillPaddingInactive: 4
}
