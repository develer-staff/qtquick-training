import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#1B2F46"

    Button {
        width: 150
        height: 50
        text: "Press me"
    }

    AlarmSwitch {
        anchors.right: parent.right
    }
}
