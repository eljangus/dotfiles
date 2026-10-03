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
            // Sort workspaces by output, then by index
            workspacesList.sort((a, b) => {
                if (a.output !== b.output)
                    return a.output.localeCompare(b.output);

                return a.idx - b.idx;
            });
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
        if (event.WorkspaceActivated) {
            for (var i = 0; i < workspaces.count; i++) {
                if (workspaces.get(i).id === event.WorkspaceActivated.id) {
                    const output = workspaces.get(i).output;
                    for (var j = 0; j < workspaces.count; j++) {
                        if (workspaces.get(j).output === output)
                            workspaces.setProperty(j, "isActive", false);

                    }
                    workspaces.setProperty(i, "isActive", true);
                    if (event.WorkspaceActivated.focused) {
                        for (var k = 0; k < workspaces.count; k++) {
                            workspaces.setProperty(k, "isFocused", false);
                        }
                        workspaces.setProperty(i, "isFocused", true);
                    }
                    break;
                }
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
