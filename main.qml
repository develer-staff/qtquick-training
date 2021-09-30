import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 480
    height: 800
    visible: true
    title: qsTr("Hello World")
    color: "#151B2E"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: pageHome
    }

    Component {
        id: pageHome
        PageHome {
            onOpenAlarmPage: stackView.push(pageAlarm)
            onOpenAlarmListPage: stackView.push(pageAlarmList)
        }
    }

    Component {
        id: pageAlarm
        PageAlarm {
            onAlarmSet: stackView.pop()
            onBack: stackView.pop()
        }
    }

    Component {
        id: pageAlarmList
        PageAlarmList {
            onBack: stackView.pop()
        }
    }
}
