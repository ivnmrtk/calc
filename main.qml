import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Window {
    visible: true
    color: "white";
    property double arg1
    property double arg2
    property bool check
    property string op
    width: 400
    height: 400
    property string displayedText: "Посчитаем?"

    function addNum(aNum) {
        console.log("text = " +displayedText + ", arg1 = " + arg1 + ", arg2 = " + arg2 + ", op = " + op + ", check = "+ check)
        if (displayedText === "Посчитаем?" || displayedText === "0" ||displayedText == op || check == true){
            displayedText = aNum
            check = false
        } else {
            displayedText += aNum
        }
        if (op != ""){
            arg2 = displayedText
        } else {
            arg1 = displayedText
        }
        console.log("text = " +displayedText + ", arg1 = " + arg1 + ", arg2 = " + arg2 + ", op = " + op + ", check = "+ check)
    }
    function addAction(aAction) {
        console.log("text = " +displayedText + ", arg1 = " + arg1 + ", arg2 = " + arg2 + ", op = " + op + ", check = "+ check)
        if (aAction === "C") {
            arg1 = 0
            arg2 = 0
            op = ""
            check = false
            displayedText = "0"
        } else {
            if (arg1 != 0 && arg2 != 0){
                calc("=")
                op = aAction
                displayedText = op
            } else {
                op = aAction
                displayedText = op
            }
        }
        console.log("text = " +displayedText + ", arg1 = " + arg1 + ", arg2 = " + arg2 + ", op = " + op + ", check = "+ check)
    }
    function calc(aOper) {
        console.log("text = " +displayedText + ", arg1 = " + arg1 + ", arg2 = " + arg2 + ", op = " + op + ", check = "+ check)
        if(op != "") {
            switch (op) {
            case "+":
                arg1 = arg1 + arg2
                break
            case "-":
                arg1 = arg1 - arg2
                break
            case "*":
                arg1 = arg1 * arg2
                break
            case "/":
                arg1 = arg1 / arg2
                break
            }
            displayedText = arg1
            check = true
        }
        console.log("text = " +displayedText + ", arg1 = " + arg1 + ", arg2 = " + arg2 + ", op = " + op + ", check = "+ check)
    }

    id: main
    title: qsTr("Калькулятор")

    GridLayout {
        rows: 5
        columns: 5
        anchors.fill: parent        
        TextEdit {
            Layout.row: 1
            Layout.column: 1
            Layout.columnSpan: 5
            text: main.displayedText
            font.pixelSize: 30
            anchors.right: parent.right
            padding: 20
            color: "Blue";
        }
        Button {
            Layout.row: 2
            Layout.column: 1
            text: "7"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: addNum("7")
        }
        Button {
            Layout.row: 2
            Layout.column: 2
            text: "8"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("8")
        }
        Button {
            Layout.row: 2
            Layout.column: 3
            text: "9"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("9")
        }
        Button {
            Layout.row: 2
            Layout.column: 4
            text: "/"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: addAction(text)
        }
        Button {
            Layout.row: 2
            Layout.rowSpan: 2
            Layout.column: 5
            text: "C"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: addAction(text)
        }
        Button {
            Layout.row: 3
            Layout.column: 1
            text: "4"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("4")
        }
        Button {
            Layout.row: 3
            Layout.column: 2
            text: "5"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("5")
        }
        Button {
            Layout.row: 3
            Layout.column: 3
            text: "6"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("6")
        }
        Button {
            Layout.row: 3
            Layout.column: 4
            text: "*"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: addAction(text)
        }
        Button {
            Layout.row: 4
            Layout.column: 1
            text: "1"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("1")
        }
        Button {
            Layout.row: 4
            Layout.column: 2
            text: "2"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("2")
        }
        Button {
            Layout.row: 4
            Layout.column: 3
            text: "3"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("3")
        }
        Button {
            Layout.row: 4
            Layout.column: 4
            text: "-"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: addAction(text)
        }
        Button {
            Layout.row: 4
            Layout.rowSpan: 2
            Layout.column: 5
            text: "="
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: calc(text)
        }
        Button {
            Layout.row: 5
            Layout.column: 1
            Layout.columnSpan: 2
            text: "0"           
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
             onClicked: addNum("0")
        }
        Button {
            Layout.row: 5
            Layout.column: 3
            Layout.columnSpan: 2
            text: "+"
            font.pixelSize: 24
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: addAction(text)

        }
    }
}
