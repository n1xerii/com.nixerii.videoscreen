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

    width: 400
    height: 250

    Plasmoid.backgroundHints: setBackground()

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
