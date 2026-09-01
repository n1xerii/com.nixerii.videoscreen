import QtQml
import QtQuick
import QtQuick.Layouts
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import QtMultimedia

PlasmoidItem {
    id: widget

    Plasmoid.icon: 'image-video'
    Plasmoid.backgroundHints: setBackground()

    MediaPlayer {
        id: player

        source: "file://" + plasmoid.configuration.videoPath

        playbackRate: parseFloat(plasmoid.configuration.videoSpeed) || 1.0
        loops: MediaPlayer.Infinite
        autoPlay: true

        audioOutput: AudioOutput {
            volume: parseFloat(plasmoid.configuration.videoVolume) || 1.0
            muted: plasmoid.configuration.videoMuted
        }

        videoOutput: videoOutput
    }

    VideoOutput {
        id: videoOutput

        anchors.fill: parent

        fillMode: widget.setFillMode()
        mirrored: plasmoid.configuration.videoMirrored
        opacity: plasmoid.configuration.videoOpacity
    }

    compactRepresentation: Compact {}
    fullRepresentation: Full {}

    function setFillMode() {
        switch (plasmoid.configuration.videoFillMode) {
            case 0:
                return VideoOutput.Stretch
                break;
            case 1:
                return VideoOutput.PreserveAspectFit
                break;
            case 2:
                return VideoOutput.PreserveAspectCrop
                break;
            default:
                return VideoOutput.Stretch
                break;
        }
    }

    function setBackground() {
        if (plasmoid.configuration.noBackground) {
            return PlasmaCore.Types.NoBackground
        }
        return PlasmaCore.Types.TranslucentBackground
    }
}
