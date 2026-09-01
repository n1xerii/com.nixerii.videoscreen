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

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            if (player.playbackState === MediaPlayer.PlayingState)
                player.pause()
            else
                player.play()
        }
    }
}
