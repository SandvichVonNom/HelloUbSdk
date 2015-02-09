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
        title: i18n.tr("Simple")

        Rectangle { id: corner
            x: units.gu(1)
            y: units.gu(1)
            width: units.gu(10)
            height: units.gu(5)
            color: "purple"
        }

        Row { id: topbar
            spacing: units.gu(1)
            anchors.margins: units.gu(1)
            anchors.verticalCenter: corner.verticalCenter
            anchors.left: corner.right
            height: corner.height

            Button { id: topbutton
                objectName: "topbutton"
                height: parent.height
                text: i18n.tr("Boop This")
                onClicked: rectangletext.text = i18n.tr("Topside")
            }

        }

        Column { id: leftcolumn
            spacing: units.gu(1)
            anchors.margins: units.gu(1)
            anchors.top: corner.bottom
            anchors.horizontalCenter: corner.horizontalCenter
            width: corner.width

            Button { id: button
                objectName: "button"
                text: i18n.tr("Tap me!")
                onClicked: {
                    rectangletext.text = i18n.tr("Gentleman")
                    console.log("Hello Console!")
                }
            }

            Rectangle { id: rectangle
                objectName: "rectangle"
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

