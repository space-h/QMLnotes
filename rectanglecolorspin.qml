import QtQuick 2.15
import QtQuick.Controls 2.15

Window
{
    visible: true
    width: 300
    height: 300
    title: "Color-Changing Rectangle"
    color: "grey"

    Rectangle
    {
        id: myRectangle
        width: 100
        height: 100
        radius: 0
        anchors.centerIn: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "red" }
            GradientStop { position: 0.33; color: "yellow" }
            GradientStop { position: 1.0; color: "green" }
        }

        MouseArea
        {
            //Loop of default gradient, black, random color, random gradient,black,random color, random gradient, black
            anchors.fill: myRectangle
            onClicked: {
              myRectangle.rotation += 90
              if (myRectangle.gradient != null)
              {myRectangle.gradient = null
              myRectangle.color = "#000000"}
              else if (myRectangle.color == "#000000")
              {
                myRectangle.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
              }
              else
              {myRectangle.gradient = Math.floor(Math.random() * 10) + 1}
            }
        }
        Behavior on rotation
        {
            NumberAnimation
            {
                easing.type: easing.InExpo
                duration: 5000
            }
        }

    }
}
