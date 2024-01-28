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
        width: 400
        height: 500




        Rectangle{
            id: topbar
            width: 400
            height: 250
            color: "blue"
            Rectangle{
                id:topcube
                width: 50
                height: 50
                color: "pink"
            }

        }


        Rectangle{
            id: bottombar
            width: 400
            height: 250
            color: "violet"
            anchors.top: topbar.bottom
            Rectangle{
                id: botcube
                /*manual position change, can go outside the confines of the parent */
                x: -50
                y: 20
                width: 50
                height: 50
                color: "orange"

            }
            Rectangle{
                id:botbar
                anchors.centerIn: parent
                width: 300
                height: 50
                color: "yellow"
            }
        }
    }
}
