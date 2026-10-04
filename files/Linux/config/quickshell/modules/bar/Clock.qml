import QtQuick
import qs.config
import qs.services

Text {
    text: `${Time.twentyFourHourTimeDate}`
    color: Theme.textOnSurface
    font.pointSize: Theme.fontSize
}
