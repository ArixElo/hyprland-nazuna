import QtQuick 2.15
import SddmComponents 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: 1920; height: 1080; color: "#070814"

    property color accent: "#f595ff"
    property color normalText: "#f3eafe"
    property color primaryShade: "#101424"

    Image {
        anchors.fill: parent
        source: "background.png"
        fillMode: Image.PreserveAspectCrop
        opacity: 0.4
    }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#00000000" }
            GradientStop { position: 1.0; color: "#101424cc" }
        }
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            passField.text = ""
            passField.focus = true
        }
        function onLoginSucceeded() {
            // Sukces - Hyprland wystartuje
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 40

        Text {
            id: clock
            anchors.horizontalCenter: parent.horizontalCenter
            color: accent
            font.pixelSize: 80
            font.family: "JetBrainsMono Nerd Font"
            font.bold: true
            text: Qt.formatTime(new Date(), "hh:mm:ss")
            
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.text = Qt.formatTime(new Date(), "hh:mm:ss")
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: normalText
            font.pixelSize: 24
            font.family: "JetBrainsMono Nerd Font"
            property var now: new Date()
            text: now.toLocaleDateString(Qt.locale("pl_PL"),"dddd, MMMM d, yyyy")
            
            Timer {
                interval: 60000
                running: true
                repeat: true
                onTriggered: parent.text = Qt.formatDate(new Date(), "dd/MM/yyyy")
            }
        }

        Rectangle {
            width: 400
            height: 300
            radius: 20
            color: primaryShade
            border.color: accent
            border.width: 2

            Column {
                anchors.centerIn: parent
                spacing: 20
                width: parent.width - 40

                TextField {
                    id: userField
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: 50
		    placeholderText: "Username"
                    color: normalText
                    font.pixelSize: 18
                    font.family: "JetBrainsMono Nerd Font"
                    background: Rectangle {
                        color: "#1b192e"
                        radius: 10
                        border.color: accent
                        border.width: 2
                    }
                    KeyNavigation.tab: passField
                }

                TextField {
                    id: passField
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: 50
                    placeholderText: "Password"
                    echoMode: TextInput.Password
                    color: normalText
                    font.pixelSize: 18
                    font.family: "JetBrainsMono Nerd Font"
                    background: Rectangle {
                        color: "#1b192e"
                        radius: 10
                        border.color: accent
                        border.width: 2
                    }
                    Keys.onReturnPressed: loginAction()
                    KeyNavigation.backtab: userField
                    KeyNavigation.tab: loginBtn
                }

                Rectangle {
                    id: loginBtn
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: 50
                    radius: 10
                    color: accent
                    border.color: normalText
                    border.width: 1

                    Text {
                        anchors.centerIn: parent
                        text: "LOGIN"
                        font.pixelSize: 20
                        font.bold: true
                        color: "#070814"
                        font.family: "JetBrainsMono Nerd Font"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: loginAction()
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }

                    Keys.onReturnPressed: loginAction()
                    KeyNavigation.backtab: passField
                }
            }
        }
    }

    function loginAction() {
        var username = userField.text || "arixelo"
        if (username && passField.text) {
            sddm.login(username, passField.text, "hyprland")
        }
    }
}
