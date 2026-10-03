import QtQuick
import qs.config
import qs.services

Text {
    text: `${Time.time}`
    color: Theme.foreground
    font.pointSize: Theme.fontSize
}
