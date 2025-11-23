/*
** PyranometerPage.qml
** Page détaillée pyranomètre avec efficience PV
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	readonly property string bindPrefix: "dbus/com.victronenergy.meteo"

	GradientListView {
		model: VisibleItemModel {
			
			// ============ Solar Irradiance ============
			ListQuantity {
				text: qsTr("Irradiance")
				dataItem.uid: root.bindPrefix + "/Irradiance"
				unit: VenusOS.Units_WattsPerSquareMetre
				precision: 1
			}
		}
	}
}
