import QtQuick 2.15

Item {
    id: root
    signal alarmSet
    signal back

    Text {
        text: "Alarm page"
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

    Column {
        spacing: 10
        x: 28
        y: 160

        Rectangle {
            width: 190
            height: 280
            color: "#1B2F46"
            radius: 30

            Text {
                width: 190
                y: 43
                horizontalAlignment: Text.AlignHCenter
                color: "#FCB647"
                font.pixelSize: 120
                text: Qt.formatTime(alarmSetButton.hourMinute, "hh")
            }

            Text {
                color: "#9FAAB0"
                font.pixelSize: 20
                text: "hour"
                y: 215
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        ButtonArrow {
            onClicked: {
                var tmp = alarmSetButton.hourMinute
                tmp.setHours(tmp.getHours() + 1)
                alarmSetButton.hourMinute = tmp
            }
        }

        ButtonArrow {
            rotation: 180
            onClicked: {
                var tmp = alarmSetButton.hourMinute
                tmp.setHours(tmp.getHours() - 1)
                alarmSetButton.hourMinute = tmp
            }
        }
    }

    Column {
        spacing: 10
        x: 262
        y: 160

        Rectangle {
            width: 190
            height: 280
            color: "#1B2F46"
            radius: 30

            Text {
                width: 190
                y: 43
                horizontalAlignment: Text.AlignHCenter
                color: "#FCB647"
                font.pixelSize: 120
                text: Qt.formatTime(alarmSetButton.hourMinute, "mm")
            }

            Text {
                color: "#9FAAB0"
                font.pixelSize: 20
                text: "minute"
                y: 215
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        ButtonArrow {
            onClicked: {
                var tmp = alarmSetButton.hourMinute
                tmp.setMinutes(tmp.getMinutes() + 1)
                alarmSetButton.hourMinute = tmp
            }
        }

        ButtonArrow {
            rotation: 180
            onClicked: {
                var tmp = alarmSetButton.hourMinute
                tmp.setMinutes(tmp.getMinutes() - 1)
                alarmSetButton.hourMinute = tmp
            }
        }
    }

    Button {
        id: alarmSetButton
        property date hourMinute: new Date()
        width: 434
        height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        text: "Set alarm"
        onClicked: {
            clockObject.addAlarm(alarmSetButton.hourMinute)
            root.alarmSet()
        }
    }
}
