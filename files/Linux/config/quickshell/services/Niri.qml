import Quickshell
import Quickshell.Io
pragma Singleton

Singleton {
    id: root

    readonly property var socketPath: Quickshell.env("NIRI_SOCKET")
    property var workspaces: []

    Socket {
    }

}
