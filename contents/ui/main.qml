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

    Video {
        id: video

        anchors.fill: parent

        autoPlay: true
        loops: MediaPlayer.Infinite

        source: "file://" + plasmoid.configuration.videoPath
        playbackRate: parseFloat(plasmoid.configuration.videoSpeed) || 1.0
        volume: parseFloat(plasmoid.configuration.videoVolume) || 1.0
        muted: plasmoid.configuration.videoMuted

        opacity: parseFloat(plasmoid.configuration.videoOpacity) || 1.0
        fillMode: widget.setFillMode()
        mirrored: plasmoid.configuration.videoMirrored
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
