import QtQuick 2.0
import QtQuick.Controls 2.5 as QQC2
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: page

    property alias cfg_videoPath: videoPath.text
    property alias cfg_videoSpeed: videoSpeed.text
    property alias cfg_videoVolume: videoVolume.text

    property alias cfg_videoFillMode: videoFillMode.currentIndex

    Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: i18n("Playback")
    }

    QQC2.TextField {
        id: videoPath

        Kirigami.FormData.label: i18n("Path:")
        placeholderText: i18n("path/to/video.mp4")
    }
    QQC2.TextField {
        id: videoSpeed

        placeholderText: i18n("default: 1.0")
        Kirigami.FormData.label: i18n("Speed:")
    }
    QQC2.TextField {
        id: videoVolume

        placeholderText: i18n("default: 1.0")
        Kirigami.FormData.label: i18n("Volume:")
    }

    QQC2.ComboBox {
        id: videoFillMode

        model: ["Stretch", "PreserveAspectFit", "PreserveAspectCrop"]

        Kirigami.FormData.label: i18n("Fill mode:")
    }
}
