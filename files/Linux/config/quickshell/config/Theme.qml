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
    // Containers = muted version of the accent, light text on top
    readonly property color primary: "#7aa2f7"
    readonly property color textOnPrimary: "#1a1b26"
    readonly property color primaryContainer: "#3d59a1"
    readonly property color textOnPrimaryContainer: "#c0caf5"
    readonly property color secondary: "#bb9af7"
    readonly property color textOnSecondary: "#1a1b26"
    readonly property color secondaryContainer: "#625484"
    readonly property color textOnSecondaryContainer: "#c0caf5"
    readonly property color tertiary: "#7dcfff"
    readonly property color textOnTertiary: "#1a1b26"
    readonly property color tertiaryContainer: "#466c88"
    readonly property color textOnTertiaryContainer: "#c0caf5"
    readonly property color error: "#f7768e"
    readonly property color textOnError: "#1a1b26"
    readonly property color errorContainer: "#7d4455"
    readonly property color textOnErrorContainer: "#c0caf5"
    readonly property color shadowColor: "#000000"
    // Extras
    readonly property color warning: "#e0af68"
    readonly property color success: "#9ece6a"
    // Fonts
    readonly property real fontSize: 14
    readonly property real widgetFontSize: 12
    // Bar
    readonly property real barHeight: 50
    readonly property real barRadius: 0
    readonly property real barPaddingHor: 10
    readonly property real barPaddingVert: 8
    readonly property real panelMargin: 0
    readonly property real screenCornerRadius: 10
    readonly property real gothBottom: 0
    readonly property real gothLeft: 0
    readonly property real gothRight: 0
    readonly property real gothTop: 0
    readonly property real frameWidth: 10
    readonly property real shadowOpacity: 1
    readonly property real shadowBlur: 1
    // Capsule (background behind each bar widget)
    readonly property real capsuleRadiusOverride: 10
    readonly property real capsuleRadius: capsuleRadiusOverride >= 0 ? capsuleRadiusOverride : Math.max(0, barRadius - barPaddingVert)
    readonly property real capsulePadding: 6
    readonly property real capsulePaddingHorizontal: 6
    // Workspaces capsule + pills (items inside it)
    readonly property real wsCapsulePadding: pillMargin
    // pillMargin makes it fit perfectly
    readonly property real wsSpacing: 8
    readonly property real pillRadiusOverride: -1
    readonly property real pillRadius: pillRadiusOverride >= 0 ? pillRadiusOverride : Math.max(0, capsuleRadius - pillMargin)
    readonly property real pillMargin: 6
    readonly property real pillPaddingActive: 4 * pillPaddingInactive
    readonly property real pillPaddingInactive: 4
}
