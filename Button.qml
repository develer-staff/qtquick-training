import QtQuick 2.15

MouseArea {
    id: root
    property alias text: innerText.text
    hoverEnabled: true

    Rectangle {
        id: innerRect
        border.color: "#FCB647"
        color: "#1B2F46"
        radius: 35
        anchors.fill: parent
    }

    Text {
        id: innerText
        color: "#FCB647"
        text: root.text
        font.bold: true
        font.pointSize: 20
        anchors.centerIn: parent
    }

    states: [
        State {
            name: "hovered"
            when: root.containsMouse
            PropertyChanges {
                target: innerText
                color: "#1B2F46"
            }
            PropertyChanges {
                target: innerRect
                color: "#FCB647"
            }
        }
    ]

    transitions: Transition {
        from: "*"
        to: "*"

        ColorAnimation {
            duration: 200
        }
    }
}
