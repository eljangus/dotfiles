import QtQuick
import Quickshell
import Quickshell.Io
pragma Singleton

Singleton {
    id: root

    readonly property var socketPath: Quickshell.env("NIRI_SOCKET")
    property var workspacesList: []
    property ListModel workspaces

    function eventHandler(event) {
        if (event.WorkspacesChanged) {
            workspacesList = event.WorkspacesChanged.workspaces.slice();
            workspaces.clear();
            for (var ws of workspacesList) {
                workspaces.append({
                    "id": ws.id,
                    "idx": ws.idx,
                    "name": ws.name || "",
                    "output": ws.output || "",
                    "isFocused": ws.is_focused === true,
                    "isActive": ws.is_active === true,
                    "isUrgent": ws.is_urgent === true,
                    "isOccupied": ws.active_window_id ? true : false
                });
            }
        }
    }

    Socket {
        id: eventSocket

        connected: true
        path: root.socketPath
        onConnectionStateChanged: {
            if (connected) {
                write("\"EventStream\"\n");
                flush();
            }
        }

        parser: SplitParser {
            onRead: (data) => {
                const msg = JSON.parse(data);
                root.eventHandler(msg);
            }
        }

    }

    workspaces: ListModel {
    }

}
