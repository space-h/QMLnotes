// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.5
import Week4

Window {

    visible: true
    width: 250
    height: 700
    title: "Week4"

       Rectangle { // Rectangle is inherited from Item, Item has property "states"
            id:background
            anchors.fill: parent
            color:"black"

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


            MouseArea {
                anchors.fill: background
                onClicked: {
                    if( parent.state === "stop" )
                    {parent.state = "wait";}

                    else if( parent.state === "wait" )
                    {parent.state = "go";}

                    else if( parent.state === "go" )
                    {parent.state = "stop";}

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



        }

}

