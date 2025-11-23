/*
** PyranometerCompactPage.qml
** Vue compacte pyranomètre
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

//	readonly property string bindPrefix: "dbus/com.victronenergy.meteo"

	property string bindPrefix
	readonly property string settingsPrefix: Global.systemSettings.serviceUid + "/Settings/Service/meteo/" + device.deviceInstance

	serviceUid: bindPrefix

	GradientListView {
		model: VisibleItemModel {
			
			// ============ Solar Conditions ============
			ListQuantity {
				text: qsTr("Irradiance")
				dataItem.uid: root.bindPrefix + "/Irradiance"
				unit: VenusOS.Units_WattsPerSquareMetre
				precision: 1
			}

			ListText {
				text: qsTr("Daily Energy")
				secondaryText: dailyEnergy.isValid && dailyEnergy.value !== undefined ? dailyEnergy.value.toFixed(1) + " Wh/m²" : "--"
				VeQuickItem {
					id: dailyEnergy
					uid: root.bindPrefix + "/Energy/Daily"
				}
			}

			// ============ String 1 ============
			ListText {
				text: qsTr("String 1")
				secondaryText: ""
			}

			ListQuantity {
				text: qsTr("  Power")
				dataItem.uid: root.bindPrefix + "/PV/String1/Power"
				unit: VenusOS.Units_Watt
				precision: 0
			}

			ListQuantity {
				text: qsTr("  Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String1/Efficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
			}

			ListQuantity {
				text: qsTr("  Yield Today")
				dataItem.uid: root.bindPrefix + "/PV/String1/YieldToday"
				unit: VenusOS.Units_Energy_KiloWattHour
				precision: 3
			}

			ListQuantity {
				text: qsTr("  Daily Eff.")
				dataItem.uid: root.bindPrefix + "/PV/String1/DailyEfficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
			}

			ListText {
				text: qsTr("  Wh/Wc")
				secondaryText: s1WhWc.isValid && s1WhWc.value !== undefined ? s1WhWc.value.toFixed(2) + " Wh/Wc" : "--"
				VeQuickItem {
					id: s1WhWc
					uid: root.bindPrefix + "/PV/String1/WhPerWc"
				}
			}

			// ============ String 2 ============
			ListText {
				text: qsTr("String 2")
				secondaryText: ""
				visible: s2Power.isValid
			}

			ListQuantity {
				text: qsTr("  Power")
				dataItem.uid: root.bindPrefix + "/PV/String2/Power"
				unit: VenusOS.Units_Watt
				precision: 0
				visible: dataItem.isValid
				VeQuickItem {
					id: s2Power
					uid: root.bindPrefix + "/PV/String2/Power"
				}
			}

			ListQuantity {
				text: qsTr("  Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String2/Efficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: s2Power.isValid
			}

			ListQuantity {
				text: qsTr("  Yield Today")
				dataItem.uid: root.bindPrefix + "/PV/String2/YieldToday"
				unit: VenusOS.Units_Energy_KiloWattHour
				precision: 3
				visible: s2Power.isValid
			}

			ListQuantity {
				text: qsTr("  Daily Eff.")
				dataItem.uid: root.bindPrefix + "/PV/String2/DailyEfficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: s2Power.isValid
			}

			ListText {
				text: qsTr("  Wh/Wc")
				secondaryText: s2WhWc.isValid && s2WhWc.value !== undefined ? s2WhWc.value.toFixed(2) + " Wh/Wc" : "--"
				visible: s2WhWc.isValid
				VeQuickItem {
					id: s2WhWc
					uid: root.bindPrefix + "/PV/String2/WhPerWc"
				}
			}

			// ============ String 3 ============
			ListText {
				text: qsTr("String 3")
				secondaryText: ""
				visible: s3Power.isValid
			}

			ListQuantity {
				text: qsTr("  Power")
				dataItem.uid: root.bindPrefix + "/PV/String3/Power"
				unit: VenusOS.Units_Watt
				precision: 0
				visible: dataItem.isValid
				VeQuickItem {
					id: s3Power
					uid: root.bindPrefix + "/PV/String3/Power"
				}
			}

			ListQuantity {
				text: qsTr("  Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String3/Efficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: s3Power.isValid
			}

			ListQuantity {
				text: qsTr("  Yield Today")
				dataItem.uid: root.bindPrefix + "/PV/String3/YieldToday"
				unit: VenusOS.Units_Energy_KiloWattHour
				precision: 3
				visible: s3Power.isValid
			}

			ListQuantity {
				text: qsTr("  Daily Eff.")
				dataItem.uid: root.bindPrefix + "/PV/String3/DailyEfficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: s3Power.isValid
			}

			ListText {
				text: qsTr("  Wh/Wc")
				secondaryText: s3WhWc.isValid && s3WhWc.value !== undefined ? s3WhWc.value.toFixed(2) + " Wh/Wc" : "--"
				visible: s3WhWc.isValid
				VeQuickItem {
					id: s3WhWc
					uid: root.bindPrefix + "/PV/String3/WhPerWc"
				}
			}
		}
	}
}
