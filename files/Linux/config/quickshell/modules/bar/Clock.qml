import QtQuick
import qs.config
import qs.services

Text {
    text: `${Time.time} Uhr`
    color: Theme.foreground
    font.pointSize: Theme.fontSize
}
