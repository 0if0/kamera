import QtQuick 2.4
import Ubuntu.Components 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "kamera.username"

    width: units.gu(100)
    height: units.gu(75)

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("Kamera")
            StyleHints {
                foregroundColor: UbuntuColors.orange
                backgroundColor: UbuntuColors.porcelain
                dividerColor: UbuntuColors.slate
            }
        }


        Button {
            objectName: "button"
            height: units.gu(5)
            width: parent.width
            text: i18n.tr("refresh")
            color: UbuntuColors.orange
            anchors {
                //horizontalCenter: parent.horizontalCenter
                top: pageHeader.bottom
                //topMargin: units.gu(20)
            }
            onClicked: {

                image.source = ""
                //image.source = "http://" + ipadress + "/snapshot.cgi?user=" + user + "&pwd=" + user

            }

            Item {
                Timer {

                    interval: 3000; running: true; repeat: true
                    onTriggered:{
                        var ipadress="10.0.0.4"
                        var user = "simon"
                        var pwd = "simon"
                        image.source = ""
                        image.source = "http://" + ipadress + "/snapshot.cgi?user=" + user + "&pwd=" + user
                    }
                    }

            }



            Image {
                id: image
                x: 100
                y: 100
                source: "http://10.0.0.4/snapshot.cgi?user=simon&pwd=simon"
                cache:false
                height: units.gu(50)
                width: units.gu(70)
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    //verticalCenter: parent.verticalCenter
                    //top: pageHeader.bottom
                    //topMargin: units.gu(2)
                }
            }
        }
    }
}

