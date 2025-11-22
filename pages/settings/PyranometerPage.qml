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

			ListText {
				text: qsTr("Daily Energy")
				secondaryText: dailyEnergy.isValid && dailyEnergy.value !== undefined ? dailyEnergy.value.toFixed(1) + " Wh/m²" : "--"
				VeQuickItem {
					id: dailyEnergy
					uid: root.bindPrefix + "/Energy/Daily"
				}
			}

			ListQuantity {
				text: qsTr("Today's Yield")
				dataItem.uid: root.bindPrefix + "/TodaysYield"
				unit: VenusOS.Units_Energy_KiloWattHour
				precision: 3
			}

			ListText {
				text: qsTr("Last Reset")
				secondaryText: lastReset.value || "--"
				VeQuickItem {
					id: lastReset
					uid: root.bindPrefix + "/Energy/LastReset"
				}
			}

			// ============ String 1 ============
			ListText {
				text: qsTr("String 1")
				secondaryText: string1Name.value || "--"
				VeQuickItem {
					id: string1Name
					uid: root.bindPrefix + "/PV/String1/Name"
				}
			}

			ListQuantity {
				text: qsTr("  Power (Actual)")
				dataItem.uid: root.bindPrefix + "/PV/String1/Power"
				unit: VenusOS.Units_Watt
				precision: 1
			}

			ListQuantity {
				text: qsTr("  Theoretical Power")
				dataItem.uid: root.bindPrefix + "/PV/String1/TheoreticalPower"
				unit: VenusOS.Units_Watt
				precision: 1
			}

			ListQuantity {
				text: qsTr("  Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String1/Efficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
			}

			ListQuantity {
				text: qsTr("  Performance Ratio")
				dataItem.uid: root.bindPrefix + "/PV/String1/PerformanceRatio"
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
				text: qsTr("  Daily Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String1/DailyEfficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
			}

			ListText {
				text: qsTr("  Wh/Wc")
				secondaryText: string1WhWc.isValid && string1WhWc.value !== undefined ? string1WhWc.value.toFixed(2) + " Wh/Wc" : "--"
				VeQuickItem {
					id: string1WhWc
					uid: root.bindPrefix + "/PV/String1/WhPerWc"
				}
			}

			// ============ String 2 ============
			ListText {
				text: qsTr("String 2")
				secondaryText: string2Name.value || "--"
				visible: string2Power.isValid
				VeQuickItem {
					id: string2Name
					uid: root.bindPrefix + "/PV/String2/Name"
				}
			}

			ListQuantity {
				text: qsTr("  Power (Actual)")
				dataItem.uid: root.bindPrefix + "/PV/String2/Power"
				unit: VenusOS.Units_Watt
				precision: 1
				visible: dataItem.isValid
				VeQuickItem {
					id: string2Power
					uid: root.bindPrefix + "/PV/String2/Power"
				}
			}

			ListQuantity {
				text: qsTr("  Theoretical Power")
				dataItem.uid: root.bindPrefix + "/PV/String2/TheoreticalPower"
				unit: VenusOS.Units_Watt
				precision: 1
				visible: string2Power.isValid
			}

			ListQuantity {
				text: qsTr("  Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String2/Efficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: string2Power.isValid
			}

			ListQuantity {
				text: qsTr("  Performance Ratio")
				dataItem.uid: root.bindPrefix + "/PV/String2/PerformanceRatio"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: string2Power.isValid
			}

			ListQuantity {
				text: qsTr("  Yield Today")
				dataItem.uid: root.bindPrefix + "/PV/String2/YieldToday"
				unit: VenusOS.Units_Energy_KiloWattHour
				precision: 3
				visible: string2Power.isValid
			}

			ListQuantity {
				text: qsTr("  Daily Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String2/DailyEfficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: string2Power.isValid
			}

			ListText {
				text: qsTr("  Wh/Wc")
				secondaryText: string2WhWc.isValid && string2WhWc.value !== undefined ? string2WhWc.value.toFixed(2) + " Wh/Wc" : "--"
				visible: string2WhWc.isValid
				VeQuickItem {
					id: string2WhWc
					uid: root.bindPrefix + "/PV/String2/WhPerWc"
				}
			}

			// ============ String 3 ============
			ListText {
				text: qsTr("String 3")
				secondaryText: string3Name.value || "--"
				visible: string3Power.isValid
				VeQuickItem {
					id: string3Name
					uid: root.bindPrefix + "/PV/String3/Name"
				}
			}

			ListQuantity {
				text: qsTr("  Power (Actual)")
				dataItem.uid: root.bindPrefix + "/PV/String3/Power"
				unit: VenusOS.Units_Watt
				precision: 1
				visible: dataItem.isValid
				VeQuickItem {
					id: string3Power
					uid: root.bindPrefix + "/PV/String3/Power"
				}
			}

			ListQuantity {
				text: qsTr("  Theoretical Power")
				dataItem.uid: root.bindPrefix + "/PV/String3/TheoreticalPower"
				unit: VenusOS.Units_Watt
				precision: 1
				visible: string3Power.isValid
			}

			ListQuantity {
				text: qsTr("  Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String3/Efficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: string3Power.isValid
			}

			ListQuantity {
				text: qsTr("  Performance Ratio")
				dataItem.uid: root.bindPrefix + "/PV/String3/PerformanceRatio"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: string3Power.isValid
			}

			ListQuantity {
				text: qsTr("  Yield Today")
				dataItem.uid: root.bindPrefix + "/PV/String3/YieldToday"
				unit: VenusOS.Units_Energy_KiloWattHour
				precision: 3
				visible: string3Power.isValid
			}

			ListQuantity {
				text: qsTr("  Daily Efficiency")
				dataItem.uid: root.bindPrefix + "/PV/String3/DailyEfficiency"
				unit: VenusOS.Units_Percentage
				precision: 1
				visible: string3Power.isValid
			}

			ListText {
				text: qsTr("  Wh/Wc")
				secondaryText: string3WhWc.isValid && string3WhWc.value !== undefined ? string3WhWc.value.toFixed(2) + " Wh/Wc" : "--"
				visible: string3WhWc.isValid
				VeQuickItem {
					id: string3WhWc
					uid: root.bindPrefix + "/PV/String3/WhPerWc"
				}
			}
		}
	}
}
