import QtQuick 2.15
import QtQuick.Controls 2.15

Window
{
    visible: true
    width: 500
    height: 500
    title: "Color-Changing Rectangle"
    color: "grey"

    Text
    {
        id: textbox
        anchors.centerIn: parent
        text: "Click to reduce font"
        font.family: "Helvetica"
        font.pointSize: 30
        color: "red"

        Timer {
            id: timer
            interval: 2000 // 1 second delay
            onTriggered: {
                textbox.text = "Click to reduce font"
                textbox.font.pointSize = 30
                textbox.color = "red"
                }
        }

        MouseArea{
            anchors.fill: textbox
            hoverEnabled: true

            onHoveredChanged:{
                if (containsMouse){
                textbox.color = "#000000"
                textbox.font.pointSize = 30
                textbox.text = "Hovering changes it to black"
                }
                else
                {
                    textbox.text = "Click to reduce font"
                    textbox.font.pointSize = 30
                    textbox.color = "red"
                }

            }
            onClicked: {
                textbox.color = "blue"
                textbox.font.pointSize = 20
                textbox.text = "You have clicked the text"
                timer.start()
            }

        }
    }
}
