import QtQml
import QtQuick
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import QtMultimedia
import QtQuick.Layouts

Item {
    id: compact

    Layout.preferredWidth: parseFloat(plasmoid.configuration.screenWidth) || 50.0
    Layout.minimumWidth: parseFloat(plasmoid.configuration.screenWidth) || 50.0

    Video {
        id: video

        anchors.fill: parent

        autoPlay: true

        loops: MediaPlayer.Infinite

        opacity: parseFloat(plasmoid.configuration.videoOpacity) || 1.0
        fillMode: widget.setFillMode()
        mirrored: plasmoid.configuration.videoMirrored

        source: "file://" + plasmoid.configuration.videoPath
        playbackRate: parseFloat(plasmoid.configuration.videoSpeed) || 1.0
        volume: parseFloat(plasmoid.configuration.videoVolume) || 1.0
        muted: plasmoid.configuration.videoMuted

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                if (video.playbackState === MediaPlayer.PlayingState)
                    video.pause()
                else
                    video.play()
            }
        }
    }

    /*
    PlasmaComponents.Button {
        id: popupButton

        width: parent.width
        height: parent.height
        opacity: 0

        onClicked: {
            widget.expanded = !widget.expanded
        }
    }
    */
}
