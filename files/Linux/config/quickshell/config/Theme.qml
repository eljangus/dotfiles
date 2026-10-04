import QtQuick
import Quickshell
pragma Singleton

Singleton {
    // Surfaces (dark → light)
    readonly property color surfaceContainerLowest: "#16161e"
    readonly property color surface: "#1a1b26"
    readonly property color surfaceContainerLow: "#1e2030"
    readonly property color surfaceContainer: "#222436"
    readonly property color surfaceContainerHigh: "#292e42"
    readonly property color surfaceContainerHighest: "#2f334d"
    readonly property color surfaceBright: "#3b4261"
    // Text / lines on surfaces
    readonly property color textOnSurface: "#c0caf5"
    readonly property color textOnSurfaceVariant: "#a9b1d6"
    readonly property color outline: "#565f89"
    readonly property color outlineVariant: "#3b4261"
    // Accents
    readonly property color primary: "#7aa2f7"
    readonly property color textOnPrimary: "#1a1b26"
    readonly property color primaryContainer: "#3d59a1"
    readonly property color textOnPrimaryContainer: "#c0caf5"
    readonly property color secondary: "#bb9af7"
    readonly property color textOnSecondary: "#1a1b26"
    readonly property color secondaryContainer: "#9d7cd8"
    readonly property color tertiary: "#7dcfff"
    readonly property color textOnTertiary: "#1a1b26"
    readonly property color error: "#f7768e"
    readonly property color textOnError: "#1a1b26"
    readonly property color errorContainer: "#db4b4b"
    // Extras
    readonly property color warning: "#e0af68"
    readonly property color success: "#9ece6a"
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
    // Pills (items inside the workspace widget)
    readonly property real pillRadiusOverride: barHeight
    readonly property real pillRadius: pillRadiusOverride >= 0 ? pillRadiusOverride : Math.max(0, widgetRadius - pillMargin)
    readonly property real pillMargin: 6
    readonly property real pillPaddingActive: 4 * pillPaddingInactive
    readonly property real pillPaddingInactive: 4
}
