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
                width: units.gu(20)
                height: units.gu(5)
                color: "white"
                z: 1
                Text {
                    x: units.gu(1)
                    y: units.gu(1)
                    text: "QReddit"
                    font.underline: true
                    font.bold: true
                    font.pointSize: 16
                }
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
                color: "black"



                 ListView {
                     id: subredListView
                     anchors.fill: parent
                     model: SubredditListModel {}
                     snapMode: ListView.SnapToItem
                     onCurrentItemChanged: rectangletext.text = subredListView.currentItem.itemData
                     highlight: Component {
                         Rectangle {
                             width: 200
                             height: 20
                             color: "blue"
                         }
                     }

                     delegate: Component {
                         id: subredditDelegate
                         Item {
                             property variant itemData: model.name
                             width: leftrectangle.width
                             height: subredrec.height + units.gu(.5)
                             Rectangle {
                                 id: subredrec
                                 width: leftrectangle.width
                                 height: units.gu(5)
                                 color: "white"
                                 Text {
                                     id: listitem
                                     x: units.gu(1)
                                     anchors.verticalCenter: subredrec.verticalCenter
                                     text: '<b>' + name + '</b>'
                                 }
                             }
                             MouseArea{
                                 id: itemMouseArea
                                 anchors.fill: parent
                                 onClicked: {
                                     subredListView.currentIndex = index
                                 }
                             }
                         }
                     }
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

