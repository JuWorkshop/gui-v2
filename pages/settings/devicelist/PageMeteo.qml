/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
**  nano /opt/victronenergy/gui-v2/Victron/VenusOS/pages/settings/devicelist/PageMeteo.qml
*/

import QtQuick
import Victron.VenusOS

/*
	Provides a list of settings for a meteo device.
*/
DevicePage {
	id: root

	property string bindPrefix
	readonly property string settingsPrefix: Global.systemSettings.serviceUid + "/Settings/Service/meteo/" + device.deviceInstance

	serviceUid: bindPrefix

	settingsModel: VisibleItemModel {
		ListQuantity {
			property var displayText: Units.getDisplayText(VenusOS.Units_WattsPerSquareMetre, dataItem.value, 1)
			//% "Irradiance"
			text: qsTrId("page_meteo_irradiance")
			dataItem.uid: bindPrefix + "/Irradiance"
			value: Units.getDisplayText(VenusOS.Units_WattsPerSquareMetre, dataItem.value, 1).number
			unit: VenusOS.Units_WattsPerSquareMetre
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/TodaysYield"
			//% "Today's yield"
			text: qsTrId("page_meteo_daily_yield")
			preferredVisible: dataItem.valid
			unit: VenusOS.Units_Energy_KiloWattHour
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String1/WhPerWc"
			//% "String1/WhPerWc"
			text: "String 1 Wh/Wc"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String2/WhPerWc"
			//% "String2/WhPerWc"
			text: "String 2 Wh/Wc"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String3/WhPerWc"
			//% "String 3/WhPerWc"
			text: "String3 Wh/Wc"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String1/TheoreticalYieldToday"
			//% "String 1/TheoreticalYieldToday"
			text: "String 1 TheoreticalYieldToday"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String1/YieldToday"
			//% "String 1/YieldToday"
			text: "String 1 YieldToday"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String1/DailyEfficiency"
			//% "String 1/DailyEfficiency"
			text: "String 1 DailyEfficiency"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String2/TheoreticalYieldToday"
			//% "String 2/TheoreticalYieldToday"
			text: "String 2 TheoreticalYieldToday"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String2/YieldToday"
			//% "String 2/YieldToday"
			text: "String 2 YieldToday"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String2/DailyEfficiency"
			//% "String 2/DailyEfficiency"
			text: "String 2 DailyEfficiency"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String3/TheoreticalYieldToday"
			//% "String 3/TheoreticalYieldToday"
			text: "String 3 TheoreticalYieldToday"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String3/YieldToday"
			//% "String 3/YieldToday"
			text: "String 3 YieldToday"
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/PV/String3/DailyEfficiency"
			//% "String 3/DailyEfficiency"
			text: "String 3 DailyEfficiency"
			preferredVisible: dataItem.valid
			precision: 1
		}

//		ListQuantityGroup {
//			text: "String 1:"
//			model: QuantityObjectModel {
//				QuantityObject { object: theoreticaltoday; VenusOS.Units_Watt }
//				QuantityObject { object: today; VenusOS.Units_Watt }
//				QuantityObject { object: efficiency; VenusOS.Units_Watt }
//			}
//
//			VeQuickItem {
//				id: theoreticaltoday
//				uid: bindPrefix + "/PV/String1/TheoreticalYieldToday"
//			}
//
//			VeQuickItem {
//				id: today
//				uid: bindPrefix + "/PV/String1/YieldToday"
//			}
//
//			VeQuickItem {
//				id: efficiency
//				uid: bindPrefix + "/PV/String1/DailyEfficiency"
//			}
//		}


		ListItem {
			id: sensorBattery

			//% "Sensor battery"
			text: qsTrId("page_meteo_battery_voltage")
//			preferredVisible: batteryVoltage.valid

			content.children: [
				QuantityLabel {
					id: batteryVoltageLabel
					anchors.verticalCenter: parent.verticalCenter
					font.pixelSize: Theme.font_size_body2
					value: batteryVoltage.value === undefined ? NaN : batteryVoltage.value
					unit: VenusOS.Units_Volt_DC
					VeQuickItem {
						id: batteryVoltage
						uid: bindPrefix + "/BatteryVoltage"
					}
				},
				Label {
					anchors.verticalCenter: parent.verticalCenter
					text: {
						if (lowBattery.valid) {
							const low = lowBattery.value === 1
							//% "Low"
							return low ? qsTrId("meteo_sensor_battery_status_low") : CommonWords.ok
						} else {
							return ""
						}
					}
					color: lowBattery.value === 1 ? Theme.color_red : Theme.color_green
					font.pixelSize: Theme.font_size_body2
					verticalAlignment: Text.AlignVCenter

					VeQuickItem {
						id: lowBattery
						uid:  bindPrefix + "/Alarms/LowBattery"
					}
				}
			]
		}

		ListNavigation {
			id: settingsMenu

			text: CommonWords.settings
			onClicked: Global.pageManager.pushPage("/pages/settings/devicelist/PageMeteoSettings.qml", {
				title: CommonWords.settings,
				meteoSettingsPrefix: root.settingsPrefix
			})
//			preferredVisible: root.device.productId === ProductInfo.ProductId_MeteoSensor_Imt
		}


		ListTemperature {
			//% "Cell temperature"
			text: qsTrId("page_meteo_cell_temperature")
			preferredVisible: dataItem.valid
			dataItem.uid: bindPrefix + "/CellTemperature"
			precision: 1
		}

		ListTemperature {
			text: sensor2.dataItem.valid
				//% "External temperature (1)"
				? qsTrId("page_meteo_external_temperature_1")
				//% "External temperature"
				: qsTrId("page_meteo_external_temperature")
			preferredVisible: dataItem.valid
			dataItem.uid: bindPrefix + "/ExternalTemperature"
			precision: 1
		}

		ListTemperature {
			id: sensor2

			dataItem.uid: bindPrefix + "/ExternalTemperature2"
			//% "External temperature (2)"
			text: qsTrId("page_meteo_external_temperature_2")
			preferredVisible: dataItem.valid
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/WindSpeed"
			//% "Wind speed"
			text: qsTrId("page_meteo_wind_speed")
			preferredVisible: dataItem.valid
			unit: VenusOS.Units_Speed_MetresPerSecond
			precision: 1
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/WindDirection"
			//% "Wind direction"
			text: qsTrId("page_meteo_wind_direction")
			preferredVisible: dataItem.valid
			unit: VenusOS.Units_CardinalDirection
		}

		ListQuantity {
			dataItem.uid: bindPrefix + "/InstallationPower"
			//% "Installation Power"
			text: qsTrId("page_meteo_installation_power")
//			preferredVisible: dataItem.valid
			unit: VenusOS.Units_Watt
			precision: 1
		}


//		ListNavigation {
//			id: pyranometerMenu
//			text: qsTrId("PV Overview (Compact)")
//			onClicked: Global.pageManager.pushPage("/pages/settings/devicelist/PyranometerCompactPage.qml", {
//				title: qsTrId("PV Overview (Compact)"),
//				meteoSettingsPrefix: root.settingsPrefix
//			})
////			preferredVisible: root.device.productId === ProductInfo.ProductId_MeteoSensor_Imt
//		}


	}
}
