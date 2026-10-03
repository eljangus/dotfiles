import Quickshell
import QtQuick
import Quickshell.Io
pragma Singleton

Singleton {
    id: root

    function eventHandler(event: var) {
       if (event.WorkspacesChanged) {
           workspacesList = event.WorkspacesChanged.workspaces.slice();
           workspacesIdk.push({
                                  "id": event.WorkspacesChanged.workspaces.id,
                                  "idx": event.WorkspacesChanged.workspaces.idx,
                                  "name": event.WorkspacesChanged.workspaces.name || "",
                                  "output": event.WorkspacesChanged.workspaces.output || "",
                                  "isFocused": event.WorkspacesChanged.workspaces.is_focused === true,
                                  "isActive": event.WorkspacesChanged.workspaces.is_active === true,
                                  "isUrgent": event.WorkspacesChanged.workspaces.is_urgent === true,
                                  "isOccupied": event.WorkspacesChanged.workspaces.active_window_id ? true : false
                                });
        for (var i = 0; i < workspacesIdk.length; i++) {
            workspaces.append(workspacesIdk[i]);
            }
       }
    }

    readonly property var socketPath: Quickshell.env("NIRI_SOCKET")
    property var workspacesList: []
    property var workspacesIdk: []
    property ListModel workspaces: ListModel {}

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

}
