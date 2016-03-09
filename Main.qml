import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.DownloadManager 0.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "download.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(50)
    height: units.gu(75)

    Page {
        title: i18n.tr("Download")

        Rectangle {
            width: parent.width
            height: units.gu(20)
            TextField {
                id: text
                placeholderText: "File URL to download..."
                height: units.gu(5)
                anchors {
                    left: parent.left
                    right: button.left
                    rightMargin: units.gu(2)
                }

                text: "http://bbs.unpcn.com/attachment.aspx?attachmentid=3820584"
            }

            Button {
                id: button
                text: "Download"
                height: 50
                anchors.right: parent.right
                anchors.verticalCenter: text.verticalCenter
                onClicked: {
                    single.download(text.text);
                }
            }

            TextField {
                id: downloaded
                placeholderText: "Downloaded file address"
                height: 100
                anchors {
                    left: parent.left
                    right: parent.right
                    top: button.bottom
                    rightMargin: units.gu(2)
                    topMargin: units.gu(1)
                }
            }

            ProgressBar {
                id: progress
                minimumValue: 0
                maximumValue: 100
                value: single.progress
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                SingleDownload {
                    id: single

                    onFinished: {
                        downloaded.text = path;
                        console.log("downloaded path: " + path);
                    }
                }
            }

            Image {
                anchors.top: progress.bottom
                source: downloaded.text
            }
        }
    }
}

