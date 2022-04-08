import QtQuick 2.0
import QtQuick.Layouts 1.1
import Felgo 3.0
import "../qml"


NavigationStack{

    id: navigation
    Page {
       id: loginPage
       title: qsTr("Login")

       backgroundColor: Qt.rgba(0,0,0,0.5) // page background is translucent, we can see other items beneath the page
       useSafeArea: false // do not consider safe area insets of screen
       navigationBarHidden: true


       // login form background
       Rectangle {
         id: loginForm
         anchors.centerIn: parent
         color: "white"
         width: content.width + dp(50)
         height: content.height + dp(18)
         radius: dp(8)
       }

       // login form content
       GridLayout {
         id: content
         anchors.centerIn: loginForm
         columnSpacing: dp(20)
         rowSpacing: dp(1)
         columns: 2

         // headline
         AppText {
           Layout.topMargin: dp(8)
           Layout.bottomMargin: dp(12)
           Layout.columnSpan: 2
           Layout.alignment: Qt.AlignHCenter
           text: "Sign in to your account"
           color: "green"
         }


         // column for buttons, we use column here to avoid additional spacing between buttons
         Column {
           Layout.fillWidth: true
           Layout.columnSpan: 2
           Layout.topMargin: dp(12)
           spacing: 5

           AppTextField {
             id: txtUsername
             implicitWidth: 200
             borderWidth: 1
             backgroundColor: "white"
             showClearButton: true
             font.pixelSize: sp(14)
             anchors.horizontalCenter: parent.horizontalCenter
             placeholderText: "Enter Email"
             cursorColor: "green"
            // borderColor: Theme.tintColor
            //borderWidth: !Theme.isAndroid ? dp(2) : 0
           }

           AppTextField {
             id: txtPassword
             implicitWidth: 200
             borderWidth: 1
             backgroundColor: "white"
             showClearButton: true
             font.pixelSize: sp(14)
             anchors.horizontalCenter: parent.horizontalCenter
             placeholderText: "Enter Password"
             cursorColor: "green"

             //borderColor: Theme.tintColor
             //borderWidth: !Theme.isAndroid ? dp(2) : 0
             echoMode: TextInput.Password
           }

           // buttons
           AppButton {
             text: qsTr("Login")
             flat: false
             backgroundColor: "green"
             anchors.horizontalCenter: parent.horizontalCenter
             radius: dp(3)
             onClicked: {

                 //console.log(myGlobalObject.counter)
                 //myGlobalObject.doSomething("TEXT FROM QML")
                 loginPage.navigationStack.push(subPage)
             }
           }

           AppButton {
             text: qsTr("No account yet? Register now")
             flat: true
             textColor: "green"
             anchors.horizontalCenter: parent.horizontalCenter
             onClicked: {
               loginPage.forceActiveFocus() // move focus away from text fields

               // call your logic action to register here
               console.debug("registering...")
               console.log(myGlobalObject.counter)
             }
           }

         }
       }
    }



Component {
  id: subPage
  SampleList{}
}



}

