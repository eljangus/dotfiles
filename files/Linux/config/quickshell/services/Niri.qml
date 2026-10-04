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
            // load the array from the Niri socket into workspacesList
            workspacesList = event.WorkspacesChanged.workspaces.slice();
            // Sort workspaces by output, then by index
            workspacesList.sort((a, b) => {
                if (a.output !== b.output)
                    return a.output.localeCompare(b.output);

                return a.idx - b.idx;
            });
            workspaces.clear();
            // append the parsed json array to workspaces
            for (let ws of workspacesList) {
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
        // handle isFocused and isActive
        if (event.WorkspaceActivated) {
            for (let i = 0; i < workspaces.count; i++) {
                if (workspaces.get(i).id === event.WorkspaceActivated.id) {
                    const output = workspaces.get(i).output;
                    workspaces.setProperty(i, "isActive", true);
                    for (let j = 0; j < workspaces.count; j++) {
                        if (workspaces.get(j).output === output && j !== i)
                            workspaces.setProperty(j, "isActive", false);

                    }
                    if (event.WorkspaceActivated.focused) {
                        workspaces.setProperty(i, "isFocused", true);
                        for (let k = 0; k < workspaces.count; k++) {
                            if (k !== i)
                                workspaces.setProperty(k, "isFocused", false);

                        }
                    }
                    break;
                }
            }
        }
        // change workspace color if urgent window appears
        if (event.WorkspaceUrgencyChanged) {
            for (let i = 0; i < workspaces.count; i++) {
                if (workspaces.get(i).id === event.WorkspaceUrgencyChanged.id) {
                    workspaces.setProperty(i, "isUrgent", event.WorkspaceUrgencyChanged.urgent);
                    break;
                }
            }
        }
    }

    function focusWorkspace(wsId) {
        let request = {
            "Action": {
                "FocusWorkspace": {
                    "reference": {
                        "Id": wsId
                    }
                }
            }
        };
        requestSocket.write(`${JSON.stringify(request)}\n`);
        requestSocket.flush();
    }

    Timer {
        interval: 1000
        repeat: true
        running: !eventSocket.connected || !requestSocket.connected
        onTriggered: {
            if (!eventSocket.connected)
                eventSocket.connected = true;

            if (!requestSocket.connected)
                requestSocket.connected = true;

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

    Socket {
        id: requestSocket

        connected: true
        path: root.socketPath

        parser: SplitParser {
            onRead: (reply) => {
                const socketLog = JSON.parse(reply);
                console.log(JSON.stringify(socketLog));
            }
        }

    }

    workspaces: ListModel {
    }

}
