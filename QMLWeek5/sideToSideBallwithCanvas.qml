// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.5
import QtQuick.Controls


Window {
    width: 400
    height: 300
    visible: true
    title: "Bouncing Ball"


    Canvas {
        id: drawingCanvas
        anchors.fill: parent //whole window Canvas
        onPaint: {
            //we can freely draw on our canvas here
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, 400, 300);
            ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
            ctx.fillRect(rectX, rectY, 50, 50);

        }
        property real rectX: 30
        property real rectY: 30
        property int direction: 1
    }

    Timer {
        id: animationTimer
        interval: 20
        repeat: true
        running: false
        onTriggered: {

            if(drawingCanvas.direction == 1){

            drawingCanvas.rectX += 5;
            drawingCanvas.requestPaint();

            if (drawingCanvas.rectX > 350)
            {
                drawingCanvas.direction = 2;
            }
            }


            if(drawingCanvas.direction == 2){

            drawingCanvas.rectX -= 5;
            drawingCanvas.requestPaint();

            if (drawingCanvas.rectX < 0)
            {
                drawingCanvas.direction = 1;
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
