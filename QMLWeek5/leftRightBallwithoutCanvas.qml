// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.5
import QtQuick.Controls


Window {
    width: 400
    height: 300
    visible: true
    title: "Bouncing Ball"

    Rectangle {
        id: otherBall
        radius: 100
        width: 50
        height: 50
        color: "blue"
        y: 200
        x: 100
        property bool goingRight
    }

    Timer {
        id: animationTimer
        interval: 20
        repeat: true
        running: false
        onTriggered: {

            if (otherBall.goingRight) {
                if(otherBall.x <400 -50)
                {
                    otherBall.x += 5;
                }
                else {
                    otherBall.goingRight = false;
                }

            }
            else {
                if( otherBall.x > 0) {
                        otherBall.x -= 5;
                   }
                else {
                        otherBall.goingRight = true;
                }
            }

        }
    }

    Button {
        id: startTimer
        anchors.centerIn: parent
        text: "Start/Stop"
        onClicked: {
            if (animationTimer.running === false)
            {animationTimer.running = true;}
            else
                animationTimer.running = false;
        }
    }

}
