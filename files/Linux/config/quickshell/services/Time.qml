pragma Singleton

import Quickshell
import QtQuick

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
