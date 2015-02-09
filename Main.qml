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

    Page {
        id: page
        // title: i18n.tr("Simple")

        Grid {
            id: grid
            columns: 2
            rows: 2
            width: parent.width
            height: parent.height

            Rectangle {
                id: corner
                width: parent.width/3
                height: units.gu(5)
                color: "purple"
            }

            Row {
                id: topbar
                width: parent.width - corner.width
                height: corner.height
                spacing: units.gu(1)


                Button {
                    id: topbutton
                    objectName: "topbutton"
                    //width: parent.width/2
                    height: parent.height
                    text: i18n.tr("Boop This")
                    onClicked: {
                        rectangletext.text = i18n.tr("Topside")
                    }
                }

                Button {
                    id: button
                    objectName: "button"
                    //width: parent.width/2
                    height: parent.height
                    text: i18n.tr("Tap me!")
                    onClicked: {
                        rectangletext.text = i18n.tr("Gentleman")
                    }
                }

            }

            Rectangle {
                id: leftrectangle
                width: corner.width
                height: parent.height - corner.height
                color: "lightblue"

                Component {
                    id: subredditListDelegate
                    Item {
                        id: itemsubreddit
                        width: leftrectangle.width
                        height: 50
                        Rectangle {
                            id: singlesubreddit
                            color: "pink"
                            width: itemsubreddit.width
                            height: itemsubreddit.height - 10
                            Text {
                                text: name
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }

                ListView {
                    width: leftrectangle.width; height: leftrectangle.height
                    model: SubredditListModel {}
                    delegate: subredditListDelegate
                }
            }

            Rectangle {
                id: contentwindow
                width: topbar.width
                height: leftrectangle.height
                color: "red"

                Rectangle {
                    id: rectangle
                    objectName: "rectangle"
                    width: parent.width
                    height: parent.height
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
}

