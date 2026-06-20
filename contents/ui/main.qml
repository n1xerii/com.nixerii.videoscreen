import QtQml 2.15
import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import QtMultimedia

PlasmoidItem {
    id: widget

    Plasmoid.icon: 'image-video'

    width: 100
    height: 100

    compactRepresentation: Compact {}
    fullRepresentation: Full {}
}
