import QtQuick 2.15

MouseArea {
    id: root
    property bool checked: true
    width: 112
    height: 60
    onClicked: {
        root.checked = !root.checked
    }

    Rectangle {
        anchors.fill: parent
        // Beware when using HEX values from Adobe XD
        color: root.checked ? Qt.rgba(0, 180, 157, 0.3) : Qt.rgba(159,
                                                                  170, 176, 0.2)
        radius: 8
    }

    Image {
        source: root.checked ? "assets/clock-switch-off-disable.svg" : "assets/clock-switch-off-selected.svg"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 4
    }

    Image {
        // Beware of opacity issues: https://bugreports.qt.io/browse/QTBUG-80260
        source: root.checked ? "assets/clock-switch-on-selected.svg" : "assets/clock-switch-on-disable.svg"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 4
    }
}
