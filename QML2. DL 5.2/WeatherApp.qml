// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.5
import QtQuick.Controls
import WeatherAPI2

Window
{
        visible: true
        title: "WeatherAppDemo"
        width: 400
        height: 600

    Rectangle
    {
        id: weatherUiBackground
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {position: 0; color: "white" }
            GradientStop {position: 0.5; color: "blue" }
            GradientStop {position: 1; color: "black" }
        }
        Column {
            anchors.fill: parent
            spacing: 20
            Text {
            id: locationText
            color: "white"
            font.pixelSize: 30
            text: "Tampere"
            }
            Text {
                id: weatherDescriptionText
                color: "white"
                font.pixelSize: 30
                text: "Sunny"
            }
            Text {
                id: temperatureText
                color: "white"
                font.pixelSize: 30
                text: "-5C"
            }
            Button {
                text: "update"
                onClicked: {
                fetchWeather();
                }
            }

        }
    }
    function processJson( response) {
        var weatherJsonObject = JSON.parse(response);
        try {
            locationText.text = weatherJsonObject.name;
            weatherDescriptionText.text = weatherJsonObject.weather[0].main;
            temperatureText.text = weatherJsonObject.main.temp;
        }
        catch(error){
            locationText.text = "Error parsing JSON";
        }
    }





    function fetchWeather() {
        var http = new XMLHttpRequest();
        var url = "https://api.openweathermap.org/data/2.5/weather?q=tampere&units=metric&appid=6c433438776b5be4ac86001dc88de74d"
        locationText.text = "Fetching data"
        http.onreadystatechange = function() {
            if (http.readyState=== XMLHttpRequest.DONE ) {
                if (http.status === 200 ){
                    //everthing is ok, lets parse JSON
                    var response = http.responseText;
                    locationText.text = response;
                    processJson( response )
                }
                else {
                    locationText.text = "Error fetching weather data";
                }
            }
        }
        http.open("GET", url);
        http.send();
    }

}


