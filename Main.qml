import QtQuick 2.0
import Ubuntu.Components 1.1
import "js/hello.js" as HelloJS

/*!
    \brief MainView with a Label and Button elements.
*/


MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "helloworld.sandvichvonnom"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)

    Page { id: page
        // title: i18n.tr("Simple")

        Column { id: column
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                left: parent
            }
            width: parent.width/2

            Button { id: button
                objectName: "button"
                anchors.top: label.bottom
                width: parent.width
                text: i18n.tr("Tap me!")
                onClicked: {
                    rectangletext.text = i18n.tr("Gentleman")
                    console.log("Hello Console!")
                }
            }

            Rectangle { id: rectangle
                objectName: "rectangle"
                anchors.top: button.bottom
                width: parent.width
                height: units.gu(3)
                color: "white"
                Text { id: rectangletext
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Greetings"
                }
            }
        }
    }
}

