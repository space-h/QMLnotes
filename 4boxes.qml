import QtQuick 2.15
import QtQuick.Controls 2.15

Window
{
    visible: true
    width: 600
    height: 600
    title: "Color-Changing Rectangle"
    color: "grey"

    Rectangle
    {
        id: mainRectangle
        anchors.centerIn: parent
        width: 500
        height: 350

        Rectangle{
            id: topbar
            anchors.centerIn: mainRectangle
            width: 250
            height: 250
            color: "blue"

            MouseArea
            {
                anchors.fill: topbar
                onClicked:
                {
                    topleft.color = "pink"
                    topright.color = "red"
                    botleft.color = "orange"
                    botright.color = "gold"
                }
            }

            Rectangle{
                id: topleft
                width: 50
                height: 50
                color: "pink"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 70
                MouseArea
                {
                    anchors.fill: topleft
                    onClicked:
                    {
                        topleft.color = "black"
                    }
                }
            }

            Rectangle{
                id: topright
                width: 50
                height: 50
                color: "red"
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: 70
                MouseArea
                {
                    anchors.fill: topright
                    onClicked:
                    {
                        topright.color = "black"
                    }
                }
            }

            Rectangle{
                id: botleft
                width: 50
                height: 50
                color: "orange"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 70
                MouseArea
                {
                    anchors.fill: botleft
                    onClicked:
                    {
                        botleft.color = "black"
                    }
                }
            }

            Rectangle{
                id: botright
                width: 50
                height: 50
                color: "gold"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 70
                MouseArea
                {
                    anchors.fill: botright
                    onClicked:
                    {
                        botright.color = "black"
                    }
                }
            }
        }
    }
}
