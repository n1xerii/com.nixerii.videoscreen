import QtQuick
import QtQuick.Controls as QQC
import QtQuick.Layouts as QQL
import QtQuick.Dialogs as QQD

import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    id: page

    // PATH
    property alias cfg_videoPath: videoPath.text
    property alias cfg_videoFolder: folderField.text

    // VIDEO PROPERTIES
    property alias cfg_videoInterval: videoInterval.value
    property alias cfg_videoSpeed: videoSpeed.text
    property alias cfg_videoVolume: videoVolume.text
    property alias cfg_videoMuted: videoMuted.checked
    property alias cfg_enableTimeSeek: enableTimeSeek.checked

    property alias cfg_videoFillMode: videoFillMode.currentIndex

    // APPEARANCE
    property alias cfg_noBackground: noBackground.checked
    property alias cfg_videoOpacity: videoOpacity.text
    property alias cfg_videoMirrored: videoMirrored.checked

    // PANEL
    property alias cfg_screenWidth: screenWidth.text

    Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: i18n("General")
    }

    QQL.RowLayout {
        Kirigami.FormData.label: i18n("Single:")

        QQD.FileDialog {
            id: singleDialog
    
            nameFilters: ["(*.mp4)", "(*.avi)", "(*.mov)", "(*.gif)", "(*.webp)", "(*.webm)"]
            options: FileDialog.ReadOnly

            onAccepted: videoPath.text = selectedFile.toString()
        }
        QQC.TextField {
            id: videoPath

            QQC.ToolTip.text: "If empty, folder will be used"
            QQC.ToolTip.visible: hovered

            Kirigami.FormData.label: i18n("Single video:")
            placeholderText: i18n("file:///home/user/video.ext")
        }
        QQC.Button {
            id: chooseSingle
            text: i18n("Choose file")

            onClicked: singleDialog.open()
        }
        QQC.Button {
            id: resetVideo
            text: i18n("Reset path")

            onClicked: videoPath.text = ""
        }
    }

    QQL.RowLayout {
        Kirigami.FormData.label: i18n("Folder:")

        QQD.FolderDialog {
            id: folderDialog
    
            onAccepted: folderField.text = selectedFolder.toString()
        }
        QQC.TextField {
            id: folderField
            
            placeholderText: i18n("example: file:///home/user/videos/")
            QQC.ToolTip.text: "If empty, single video is used"
            QQC.ToolTip.visible: hovered
            
            onAccepted: folderField.text = selectedFolder.toString()
        }
        QQC.Button {
            id: chooseFolder
            text: i18n("Choose folder")

            onClicked: folderDialog.open()
        }
        QQC.Button {
            id: resetFolder
            text: "Reset folder"

            onClicked: folderField.text = ""
        }
    }
    QQC.SpinBox {
        id: videoInterval
        from: 1
        to: 86400

        Kirigami.FormData.label: i18n("Interval (seconds):")
    }


    QQC.TextField {
        id: videoSpeed

        placeholderText: i18n("default: 1")
        Kirigami.FormData.label: i18n("Speed:")
    }
    QQL.RowLayout {
        Kirigami.FormData.label: i18n("Volume:")

        QQC.TextField {
            id: videoVolume
            placeholderText: i18n("default: 1")
        }

        QQC.CheckBox {
            id: videoMuted
            text: i18n("Mute")
        }
    }
    QQC.CheckBox {
        id: enableTimeSeek
        Kirigami.FormData.label: i18n("Enable seekbar:")
    }

    Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: i18n("Appearance")
    }

    QQC.ComboBox {
        id: videoFillMode

        model: [
            "Stretch",
            "PreserveAspectFit",
            "PreserveAspectCrop"
        ]
        
        Kirigami.FormData.label: i18n("Fill mode:")
    }
    QQC.CheckBox {
        id: noBackground
        Kirigami.FormData.label: i18n("Frameless:")
    }
    QQC.TextField {
        id: videoOpacity

        placeholderText: i18n("default: 1")
        Kirigami.FormData.label: i18n("Opacity:")
    }
    QQC.CheckBox {
        id: videoMirrored
        Kirigami.FormData.label: i18n("Mirrored:")
    }

    Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: i18n("Panel")
    }

    QQC.TextField {
        id: screenWidth

        placeholderText: i18n("default: 50")
        Kirigami.FormData.label: i18n("Width:")
    }
}
