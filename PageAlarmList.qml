import QtQuick 2.15

Item {
    id: root
    signal back
    Text {
        text: "Alarm list page"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 40
        font.pixelSize: 30
        color: "#9FAAB0"
    }

    BackButton {
        x: 28
        y: 20
        onClicked: root.back()
    }

    Text {
        id: header
        font.pixelSize: 20
        color: "#FCB647"
        x: 38
        y: 135
        text: "Everyday"
    }

    ListView {
        id: listView
        width: 424
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        model: clockObject
        clip: true
        delegate: Item {
            width: 424
            height: 88

            Text {
                x: 68
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                color: "#9FAAB0"
                text: Qt.formatTime(model.datetime, "hh:mm")
            }

            AlarmSwitch {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 8
                checked: model.active
            }

            Rectangle {
                width: parent.width
                height: 1
                color: "#1B2F46"
                anchors.bottom: parent.bottom
                visible: (listView.count - 1) !== model.index
            }
        }
    }
}
