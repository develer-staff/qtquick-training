import QtQuick 2.0

MouseArea {
    id: root
    width: 190
    height: 101
    hoverEnabled: true

    Image {
        source: root.containsMouse ? "assets/clock-btn-arrow (hover).svg" : "assets/clock-btn-arrow.svg"
    }
}
