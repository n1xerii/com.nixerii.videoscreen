import QtQml
import QtQuick
import QtQuick.Layouts
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import QtMultimedia
import Qt.labs.folderlistmodel as QFLM

PlasmoidItem {
    id: widget

    property string finalPath: ""
    property bool folderMode: false
    property int folderIndex: 0

    Plasmoid.icon: 'image-video'
    Plasmoid.backgroundHints: setBackground()

    Component.onCompleted: {
        updateVideo();
    }

    Connections {
        target: plasmoid.configuration

        function onVideoFolderChanged() {
            updateVideo();
        }

        function onVideoPathChanged() {
            updateVideo();
        }
    }

    QFLM.FolderListModel {
        id: folderVideos
        folder: plasmoid.configuration.videoFolder
        nameFilters: ["*.mp4", "*.avi", "*.mov", "*.gif", "*.webp", "*.webm"]
        showDirs: false

        onStatusChanged: {
            if (status === QFLM.FolderListModel.Ready) {
                updateVideo()
            }
        }
    }

    MediaPlayer {
        id: player

        //source: "file://" + plasmoid.configuration.videoPath
        source: finalPath

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

        fillMode: setFillMode()
        mirrored: plasmoid.configuration.videoMirrored
        opacity: plasmoid.configuration.videoOpacity
    }

    compactRepresentation: Compact {}
    fullRepresentation: Full {}

    function updateVideo() {
        let filePath = "";

        if (folderMode == false && plasmoid.configuration.videoFolder !== "" && folderVideos.count > 0) {
            folderMode = true;
            finalPath = folderVideos.get(0, "fileUrl");
            return;
        }

        if (folderMode) {
            if (plasmoid.configuration.videoFolder === "" || folderVideos.count <= 0) {
                folderMode = false;
            }
            finalPath = folderVideos.get(folderIndex, "fileUrl");
        }
        else {
            folderMode = false;
            filePath = plasmoid.configuration.videoPath;
            finalPath = "file://" + filePath;
        }
    }

    Timer {
        id: folderModeTimer
        interval: plasmoid.configuration.videoInterval * 1000
        repeat: true
        running: folderMode

        onRunningChanged: {
            updateVideo()
        }

        onTriggered: {
            if (folderVideos.count === 0)
                return

            folderIndex = (folderIndex + 1) % folderVideos.count
            updateVideo()
        }
    }

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
