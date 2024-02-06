import QtQuick 6.5
import QtQuick.Controls


Window
{
        visible: true
        title: "comicAppDemo"
        width: 800
        height: 500

    Rectangle
    {
        id: comicBackground
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {position: 1; color: "black" }
            GradientStop {position: 0.5; color: "grey" }
            GradientStop {position: 1; color: "black" }
        }
        Column {
            anchors.fill: parent
            spacing: 20

            Image {
                id: picture
                source: ""
            }

            Text {
            id: header
            color: "white"
            font.pixelSize: 20
            text: "New xkcd comic fetcher"
            }
            Text {
                id: comicTitle
                color: "white"
                font.pixelSize: 20
                text: "Press the button to begin"
            }

            Button {
                text: "Go forth"
                onClicked: {
                fetchComic();
                }


            }
        }
    }
    function processJson( response) {
        var comicJsonObject = JSON.parse(response);
        try {

           picture.source = comicJsonObject.img;
           comicTitle.text = "Title: " + comicJsonObject.title +
           "\nNumber: " + comicJsonObject.num +
           "\nHovertext: \"" + comicJsonObject.alt
           + "\"\nDate: " + comicJsonObject.day + "." + comicJsonObject.month + "." + comicJsonObject.year ;


        }
        catch(error){
            comicTitle.text = "Error parsing JSON";
        }
    }





    function fetchComic() {
        var http = new XMLHttpRequest();
        var url = "https://xkcd.com/info.0.json"
        comicTitle.text = "Fetching data"
        http.onreadystatechange = function() {
            if (http.readyState=== XMLHttpRequest.DONE ) {
                if (http.status === 200 ){
                    //everthing is ok, lets parse JSON
                    var response = http.responseText;
                    comicTitle.text = response;
                    processJson( response )
                }
                else {
                    comicTitle.text = "Error fetching data";
                }
            }
        }
        http.open("GET", url);
        http.send();
    }

}




