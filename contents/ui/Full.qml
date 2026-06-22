import QtQml
import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import QtMultimedia

Item {
    id: full

    HoverHandler {
        id: hoverArea
    }
    TapHandler {
        id: tap

        onTapped: {
            if (video.playbackState === MediaPlayer.PlayingState)
                video.pause()
                else
                    video.play()
        }
    }

    Video {
        id: video

        autoPlay: true

        width: parent.width
        height: parent.height

        loops: MediaPlayer.Infinite

        opacity: parseFloat(plasmoid.configuration.videoOpacity) || 1.0
        fillMode: widget.setFillMode()
        mirrored: plasmoid.configuration.videoMirrored

        source: "file://" + plasmoid.configuration.videoPath
        playbackRate: parseFloat(plasmoid.configuration.videoSpeed) || 1.0
        volume: parseFloat(plasmoid.configuration.videoVolume) || 1.0
        muted: plasmoid.configuration.videoMuted
    }

    QQC2.Slider {
        id: timeSeek
        visible: plasmoid.configuration.enableTimeSeek && hoverArea.hovered

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 8
        }

        from: 0
        to: video.duration > 0 ? video.duration : 1

        value: pressed ? value : video.position

        onMoved: {
            video.position = value
        }
    }
}
