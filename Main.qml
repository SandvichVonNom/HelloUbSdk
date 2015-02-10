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

//        Grid {
//            id: grid
//            columns: 2
//            rows: 2
//            width: parent.width
//            height: parent.height

            Rectangle {
                id: corner
                x: 1
                y: 1
                z: 100
                width: units.gu(10)
                height: units.gu(6)
                color: "#EEEDEB"

                Rectangle {
                    id: cornerborderleft
                    x: 0
                    y: 0
                    width: units.gu(1)
                    height: parent.height
                    color: "#2C001E"
                }

                Rectangle {
                    id: cornerbordertop1
                    anchors.left: cornerborderleft.right
                    anchors.top: cornerborderleft.top
                    width: units.gu(9)
                    height: units.gu(1)
                    color: "#2C001E"
                }

                Rectangle {
                    id: cornerbordertop2
                    anchors.left: cornerbordertop1.right
                    anchors.top: cornerbordertop1.top
                    width: units.gu(9)
                    height: units.gu(1)
                    color: "#DD4814"
                }

                Switch {
                    id: subredswitch
                    x: units.gu(1.5)
                    y: units.gu(1.5)
                    width: units.gu(8)
                    height: units.gu(4)
                    checked: false
                }
            }

            Rectangle {
                id: toprectangle
                anchors.left: corner.right
                anchors.top: corner.top
                width: parent.width - corner.width
                height: corner.height
                color: "#EEEDEB"

                Rectangle {
                    id: topedge
                    x: 0
                    y: 0
                    width: parent.width
                    height: units.gu(1)
                    color: "#DD4814"
                }

                Row {
                    id: topbar
                    x: units.gu(.5)
                    y: units.gu(1.5)
                    width: parent.width
                    height: parent.height - topedge.height
                    spacing: units.gu(1)


                    Button {
                        id: topbutton
                        objectName: "topbutton"
                        //width: parent.width/2
//                        height: parent.height
                        text: i18n.tr("Boop This")
                        onClicked: {
                            rectangletext.text = i18n.tr("Topside")
                        }
                    }
                }
            }

            Rectangle {
                id: leftrectangle
                anchors.top: corner.bottom
                anchors.left: corner.left
                width: units.gu(1)
                height: parent.height - corner.height
                color: "#2C001E"

                states: State {
                         name: "moved"; when: subredswitch.checked
                         PropertyChanges {
                             target: leftrectangle
                             width: units.gu(20)
                         }
                         PropertyChanges {
                             target: subredListView
                             visible: true
                         }
                }


                 ListView {
                     id: subredListView
                     anchors.fill: parent
                     width: leftrectangle.width
                     model: SubredditListModel {}
                     snapMode: ListView.SnapToItem
                     onCurrentItemChanged: rectangletext.text = subredListView.currentItem.itemData
                     visible: false
                     highlight: Component {
                         Rectangle {
                             width: leftrectangle.width
                             height: 20
                             color: "#DD4814"
                         }
                     }
                     delegate:subreddelegate
                 }

                 Component {
                      id: subreddelegate
                      Item {
                          property variant itemData: model.name
                          width: leftrectangle.width
                          height: subredrec.height + units.gu(.5)
                          Rectangle {
                              id: subredrec
                              width: leftrectangle.width
                              height: units.gu(5)
                              color: "transparent"
                              Text {
                                  id: lnistitem
                                  x: units.gu(1)
                                  anchors.verticalCenter: subredrec.verticalCenter
                                  text: '<b>' + name + '</b>'
                                  color: "white"
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

            Rectangle {
                id: contentwindow
                anchors.left: leftrectangle.right
                anchors.top: toprectangle.bottom
                width: page.width - leftrectangle.width
                height: leftrectangle.height
                color: "#EEEDEB"
                z: 99

                Rectangle {
                    id: rectangle
                    objectName: "rectangle"
                    width: parent.width
                    height: parent.height
                    color: "transparent"
                    Text { id: rectangletext
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Greetings"
                    }
                }
            }
        }
//    }
}

