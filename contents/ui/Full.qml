import QtQml 2.15
import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import QtMultimedia

Item {
    id: full

    Video {
        id: video
        autoPlay: true

        width: parent.width
        height: parent.height

        loops: MediaPlayer.Infinite

        volume: parseFloat(plasmoid.configuration.videoVolume) || 1.0
        source: "file://" + plasmoid.configuration.videoPath
        playbackRate: parseFloat(plasmoid.configuration.videoSpeed) || 1.0

        MouseArea {
            anchors.fill: parent

            onClicked: {
                if (video.playbackState === MediaPlayer.PlayingState)
                    video.pause()
                    else
                        video.play()
            }
        }
    }
}
