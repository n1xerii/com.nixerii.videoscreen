import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts as QQL
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    id: page

    // GENERAL
    property alias cfg_videoPath: videoPath.text
    property alias cfg_videoSpeed: videoSpeed.text
    property alias cfg_videoVolume: videoVolume.text
    property alias cfg_videoMuted: videoMuted.checked
    property alias cfg_enableTimeSeek: enableTimeSeek.checked

    property alias cfg_videoFillMode: videoFillMode.currentIndex

    // APPEARANCE
    property alias cfg_noBackground: noBackground.checked
    property alias cfg_videoOpacity: videoOpacity.text
    property alias cfg_videoMirrored: videoMirrored.checked

    Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: i18n("General")
    }
    QQC2.TextField {
        id: videoPath

        Kirigami.FormData.label: i18n("Video path:")
        placeholderText: i18n("path/to/video.ext")
    }
    QQC2.TextField {
        id: videoSpeed

        placeholderText: i18n("default: 1")
        Kirigami.FormData.label: i18n("Speed:")
    }
    QQL.RowLayout {
        Kirigami.FormData.label: i18n("Volume:")

        QQC2.TextField {
            id: videoVolume
            placeholderText: i18n("default: 1")
        }

        QQC2.CheckBox {
            id: videoMuted
            text: i18n("Mute")
        }
    }
    QQC2.CheckBox {
        id: enableTimeSeek
        Kirigami.FormData.label: i18n("Enable seekbar:")
    }

    QQC2.ComboBox {
        id: videoFillMode

        model: ["Stretch", "PreserveAspectFit", "PreserveAspectCrop"]

        Kirigami.FormData.label: i18n("Fill mode:")
    }


    Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: i18n("Appearance")
    }
    QQC2.CheckBox {
        id: noBackground
        Kirigami.FormData.label: i18n("Transparent background:")
    }
    QQC2.TextField {
        id: videoOpacity

        placeholderText: i18n("default: 1")
        Kirigami.FormData.label: i18n("Opacity:")
    }
    QQC2.CheckBox {
        id: videoMirrored
        Kirigami.FormData.label: i18n("Mirrored:")
    }
}
