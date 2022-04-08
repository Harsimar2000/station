import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.11

Page{
 //title: qsTr("Main Page")
    id: itemsPage

    backgroundColor: "white"
    navigationBarHidden: true

    NavigationBar{
        id : bar
        backButtonVisible: false
        backgroundColor: "white"
        dividerColor: "black"

        leftBarItem: NavigationBarItem {

             // we specify the width of the item with the contentWidth property
             // the item width then includes the contentWidth and a default padding
             contentWidth: picketa.width

             // the navigation bar item shows a colored rectangle
                padding: 20


             AppText {
                 id: picketa
                 text: qsTr("Picketa")
                 anchors.centerIn: parent
                 //anchors.leftMargin: 20
                 color: "darkgreen"
                 fontSize: 20

             }
           } // NavigationBarItem

        rightBarItem:
          NavigationBarRow{
            contentWidth: picketa.width
            padding: 60
            IconButtonBarItem {
              id: plus
              icon: IconType.plus
              //anchors.centerIn: parent
              color: "black"

              onClicked: {

                  itemsPage.navigationStack.push(uploadSample)
              }
               AppText{
                   id: fieldName;
                   text: qsTr("Name")
                   anchors.left: plus.right
                   color: "darkgreen"
                   topPadding: 10
                   fontSize: 20

               }
            }
        }

    }

    /*
    AppListView {

        anchors.top: bar.bottom
        delegate: SimpleRow {}
        model: [
          { text: "Widget test",
            detailText: "Some of the widgets available in Felgo AppSDK",
            icon: IconType.tablet },
          { text: "Shown are:",
            detailText: "ListPage, NavigationBar with different items, Switch",
            icon: IconType.question }
        ]
      }
    */

    Rectangle{

        id: item
        width: parent.width;
        anchors.top: bar.bottom
        height: 60;
        color: "white"
        border.color: "black"

        GridLayout {
            id: grid
            columns: 3


            Row{

                Layout.fillWidth: true
                Layout.columnSpan: 2
                Layout.topMargin: dp(12)
                spacing: 5
                Layout.leftMargin: 10
                AppText {
                    id: name1
                    text: qsTr("har")
                    Layout.leftMargin: 10
                    Layout.maximumHeight: 20
                    Layout.maximumWidth: 20
                    Layout.topMargin: 15
                }

                AppText {
                    id: name2
                    text: qsTr("harsimar")
                    Layout.leftMargin: 10
                    Layout.maximumHeight: 20
                    Layout.maximumWidth: 20
                    Layout.topMargin: 15
                }
            }

        }
    }

    Component{
        id: uploadSample
       UploadSample{}
    }

}


