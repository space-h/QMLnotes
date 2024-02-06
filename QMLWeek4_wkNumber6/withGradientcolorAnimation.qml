// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.5
import Week4

Window {

    visible: true
    width: 250
    height: 900
    title: "Week4"

       Rectangle { // Rectangle is inherited from Item, Item has property "states"
            id:background
            anchors.fill: parent
            color:"black"
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#000000";
                }
                GradientStop {
                    id: coloredGradientStop
                    position: 0.99
                    color: "blue"
                }
            }

            ColorAnimation {
                target: coloredGradientStop
                property: "color"
                from: "white"
                to: "blue"
                duration: 20000
                running: true

            }

            Rectangle {

                id: redLight
                radius: width
                width: parent.width * 0.75
                height: parent.width * 0.75
                color: "red"
            }

            Rectangle {
                id: yellowLight
                radius: width
                y: 200
                width: parent.width * 0.75
                height: parent.width * 0.75
                color: "yellow"
            }

            Rectangle {
                y: 400
                radius: width
                id: greenlight
                width: parent.width * 0.75
                height: parent.width * 0.75
                color: "green"
            }


            Timer {
                id: trafficLightTimer
                interval: 3000
                repeat: true
                running: false
                onTriggered: {
                    if( parent.state === "stop" )
                    {
                        interval = 4000
                        parent.state = "wait";
                    }

                    else if( parent.state === "wait" )
                    {
                        interval = 5000
                        parent.state = "go";
                    }

                    else if( parent.state === "go" )
                    {
                        interval = 3000
                        parent.state = "stop";
                    }

                }
            }

            MouseArea {
                anchors.fill: background
                onClicked: {
                    trafficLightTimer.running = true;
                }
            }
            state: "stop" //setting default property
            states: [
                State {
                name: "stop"
                PropertyChanges { target: redLight; color: "red" }
                PropertyChanges { target: greenlight; color: "black" }
                PropertyChanges { target: yellowLight; color: "black" }
                },

                State {
                name: "wait"
                PropertyChanges { target: redLight; color: "black" }
                PropertyChanges { target: greenlight; color: "black" }
                PropertyChanges { target: yellowLight; color: "yellow" }
                },

                State {
                name: "go"
                PropertyChanges { target: redLight; color: "black" }
                PropertyChanges { target: greenlight; color: "green" }
                PropertyChanges { target: yellowLight; color: "black" }
                }
            ]

            transitions: [

                Transition {
                    from: "*"
                    to: "*"
                    PropertyAnimation {
                        target: redlight
                        properties: "color"
                        duration: 1000
                    }
                    PropertyAnimation {
                        target: greenlight
                        properties: "color"
                        duration: 1000
                    }
                    PropertyAnimation {
                        target: yellowLight
                        properties: "color"
                        duration: 1000
                    }

                }
            ]



        }

}

