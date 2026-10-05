import QtQuick
import qs.config
import qs.services

Capsule {
    id: root

    Text {
        text: `${Time.twentyFourHourTimeDate}`
        color: Theme.textOnSurface
        font.pointSize: Theme.fontSize
    }

}
