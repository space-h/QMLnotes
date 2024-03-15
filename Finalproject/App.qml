import QtQuick 6.5
import QtQuick.Controls
import QtQuick.Layouts


Window
{
        visible: true
        title: "comicAppDemo"
        width: 370
        height: 812


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
            id: columnForfetcher
            anchors.fill: parent
            spacing: 40

            Image {
                id: picture
                source: ""
                fillMode: Image.PreserveAspectFit
                width: 370
                height: 450

            }

            Text {
            id: header
            color: "white"
            font.pixelSize: 20
            text: "Xkcd comic fetcher"
            horizontalAlignment: Text.AlignHCenter
            width: 370
            }

            Text {
                id: storage
                visible: false
                text: "storage"
            }

            Column
            {
                anchors.top: picture.bottom
                id: hovertextbox
                width: parent

                RowLayout {
                    id: rowtest
                    spacing: 290

                    RoundButton  {
                        id: backwards
                        opacity: 0.5
                        anchors.left: parent
                        visible: false
                        text: " < "
                        onClicked: {
                        fetchComicBackwards(storage.text)
                        }
                    }
                    RoundButton  {
                        visible: false
                        opacity: 0.5
                        id: forwards
                        text: " > "
                        anchors.right: parent
                        onClicked: {
                        fetchComicForward(storage.text)
                        }
                    }
                }

                Text {

                    id: comicTitle
                    color: "white"
                    font.pixelSize: 18
                    text: ""
                    wrapMode: Text.WordWrap
                    width: 370
                    horizontalAlignment: Text.AlignHCenter

                }

                Text {
                    id: hovertext
                    topPadding: 10
                    color: "white"
                    font.pixelSize: 18
                    text: "Press the button to begin"
                    wrapMode: Text.WordWrap
                    width: 370
                    horizontalAlignment: Text.AlignHCenter
                }



            }



            Button {
                id: beginButton
                anchors.centerIn: columnForfetcher
                text: "Begin"
                onClicked: {
                    fetchComic();
                    header.visible = false
                    beginButton.visible = false
                    forwards.visible = true
                    backwards.visible = true

                }
           }


        }
    }
    function processJson( response) {
        comicTitle.color = "white"
        var comicJsonObject = JSON.parse(response);
        try {

           picture.source = comicJsonObject.img;
           comicTitle.text = "Title: " + comicJsonObject.title +
           "\nNumber: " + comicJsonObject.num + "\nDate: " + comicJsonObject.day + "." + comicJsonObject.month + "." + comicJsonObject.year ;
           hovertext.text = comicJsonObject.alt;
           storage.text = comicJsonObject.num;
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


    function fetchComicBackwards(a) {
        var http = new XMLHttpRequest();
        a = parseInt(a)
        a = a - 1
        var url = "https://xkcd.com/" + a + "/info.0.json";
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


    function fetchComicForward(b) {

        b = parseInt(b)
        b = b + 1

        var http = new XMLHttpRequest();
        var url = "https://xkcd.com/" + b + "/info.0.json";
        http.onreadystatechange = function() {
            if (http.readyState=== XMLHttpRequest.DONE ) {
                if (http.status === 200 ){
                    //everthing is ok, lets parse JSON
                    var response = http.responseText;
                    comicTitle.text = response;
                    processJson( response )
                }
                else {
                    comicTitle.color = "red"
                    comicTitle.text = "Fetch error, newest comic is: " + storage.text;

                }
            }
        }
        http.open("GET", url);
        http.send();
    }





}
/*

    https://xkcd.com/info.0.json (current comic)
    https://xkcd.com/614/info.0.json (comic #614)

    On first Click, save comicJsonObject.num in a variable NUMBER
    click backwards, NUMBER--. "https://xkcd.com/{NUMBER}/info.0.json"
    click forwards, NUMBER ++, "https://xkcd.com/{NUMBER}/info.0.json"

*/



