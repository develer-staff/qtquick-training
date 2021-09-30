import QtQuick 2.0

Item {
    id: root
    signal openAlarmPage

    Button {
        width: 190
        height: 64
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 64
        anchors.left: parent.left
        anchors.leftMargin: 18
        text: "List"
    }

    Button {
        width: 190
        height: 64
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 64
        anchors.right: parent.right
        anchors.rightMargin: 18
        text: "Alarm"
        onClicked: root.openAlarmPage()
    }
}
