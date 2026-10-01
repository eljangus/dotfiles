import QtQuick
import Quickshell
pragma Singleton

Singleton {
    id: root

    property string time: {
        Qt.formatDateTime(clock.date, "HH:mm");
    }

    SystemClock {
        id: clock

        precision: SystemClock.Minutes
    }

}
