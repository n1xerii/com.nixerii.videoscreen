import QtQuick 2.0
import QtQuick.Controls 2.5 as QQC2
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: page

    // GENERAL
    property alias cfg_videoPath: videoPath.text
    property alias cfg_videoSpeed: videoSpeed.text
    property alias cfg_videoVolume: videoVolume.text

    // APPEARANCE
    property alias cfg_videoFillMode: videoFillMode.currentIndex
    property alias cfg_noBackground: noBackground.checked
    property alias cfg_videoOpacity: videoOpacity.text

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
    QQC2.TextField {
        id: videoVolume

        placeholderText: i18n("default: 1")
        Kirigami.FormData.label: i18n("Volume:")
    }

    QQC2.ComboBox {
        id: videoFillMode

        model: ["Stretch", "PreserveAspectFit", "PreserveAspectCrop"]

        Kirigami.FormData.label: i18n("Fill mode:")
    }
    QQC2.CheckBox {
        id: noBackground

        Kirigami.FormData.label: i18n("Transparent:")
    }
    QQC2.TextField {
        id: videoOpacity

        placeholderText: i18n("default: 1")
        Kirigami.FormData.label: i18n("Opacity:")
    }
}
