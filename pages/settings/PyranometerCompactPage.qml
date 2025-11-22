/*
 * Page compacte Pyranomètre PYR20
 * Compatible GUI V2 - Qt 6
 * Tout sur une seule page pour vue d'ensemble rapide
 */

import QtQuick
import Victron.VenusOS

Page {
    id: root
    
    title: qsTr("PV Efficiency Overview")
    
    property string serviceUid: "com.victronenergy.meteo"
    
    GradientListView {
        model: ObjectModel {
            
            // ============ Solar Conditions ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Solar Conditions")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_h2
                }
            }
            
            ListQuantityItem {
                text: qsTr("Irradiance")
                dataItem.uid: root.serviceUid + "/Irradiance"
                unit: VenusOS.Units_Watt_Per_SquareMeter
                precision: 1
            }
            
            ListQuantityItem {
                text: qsTr("Daily Energy")
                dataItem.uid: root.serviceUid + "/Energy/Daily"
                unit: VenusOS.Units_WattHour_Per_SquareMeter
                precision: 1
            }
            
            // ============ String 1 - Instant ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 1 - Instant")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_body2
                }
            }
            
            ListQuantityItem {
                text: qsTr("Power")
                dataItem.uid: root.serviceUid + "/PV/String1/Power"
                unit: VenusOS.Units_Watt
                precision: 0
            }
            
            ListQuantityItem {
                text: qsTr("Efficiency")
                dataItem.uid: root.serviceUid + "/PV/String1/Efficiency"
                unit: VenusOS.Units_Percentage
                precision: 1
            }
            
            // ============ String 1 - Daily ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 1 - Daily")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_body2
                }
            }
            
            ListQuantityItem {
                text: qsTr("Yield Today")
                dataItem.uid: root.serviceUid + "/PV/String1/YieldToday"
                unit: VenusOS.Units_Energy_KiloWattHour
                precision: 3
            }
            
            ListQuantityItem {
                text: qsTr("Daily Efficiency")
                dataItem.uid: root.serviceUid + "/PV/String1/DailyEfficiency"
                unit: VenusOS.Units_Percentage
                precision: 1
            }
            
            ListQuantityItem {
                text: qsTr("Wh/Wc")
                dataItem.uid: root.serviceUid + "/PV/String1/WhPerWc"
                unit: "Wh/Wc"
                precision: 2
            }
            
            // ============ String 2 - Instant ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 2 - Instant")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_body2
                }
                visible: string2Power.isValid
            }
            
            VeQuickItem {
                id: string2Power
                uid: root.serviceUid + "/PV/String2/Power"
            }
            
            ListQuantityItem {
                text: qsTr("Power")
                dataItem.uid: root.serviceUid + "/PV/String2/Power"
                unit: VenusOS.Units_Watt
                precision: 0
                visible: string2Power.isValid
            }
            
            ListQuantityItem {
                text: qsTr("Efficiency")
                dataItem.uid: root.serviceUid + "/PV/String2/Efficiency"
                unit: VenusOS.Units_Percentage
                precision: 1
                visible: string2Power.isValid
            }
            
            // ============ String 2 - Daily ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 2 - Daily")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_body2
                }
                visible: string2Power.isValid
            }
            
            ListQuantityItem {
                text: qsTr("Yield Today")
                dataItem.uid: root.serviceUid + "/PV/String2/YieldToday"
                unit: VenusOS.Units_Energy_KiloWattHour
                precision: 3
                visible: string2Power.isValid
            }
            
            ListQuantityItem {
                text: qsTr("Daily Efficiency")
                dataItem.uid: root.serviceUid + "/PV/String2/DailyEfficiency"
                unit: VenusOS.Units_Percentage
                precision: 1
                visible: string2Power.isValid
            }
            
            ListQuantityItem {
                text: qsTr("Wh/Wc")
                dataItem.uid: root.serviceUid + "/PV/String2/WhPerWc"
                unit: "Wh/Wc"
                precision: 2
                visible: string2Power.isValid
            }
            
            // ============ String 3 - Instant ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 3 - Instant")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_body2
                }
                visible: string3Power.isValid
            }
            
            VeQuickItem {
                id: string3Power
                uid: root.serviceUid + "/PV/String3/Power"
            }
            
            ListQuantityItem {
                text: qsTr("Power")
                dataItem.uid: root.serviceUid + "/PV/String3/Power"
                unit: VenusOS.Units_Watt
                precision: 0
                visible: string3Power.isValid
            }
            
            ListQuantityItem {
                text: qsTr("Efficiency")
                dataItem.uid: root.serviceUid + "/PV/String3/Efficiency"
                unit: VenusOS.Units_Percentage
                precision: 1
                visible: string3Power.isValid
            }
            
            // ============ String 3 - Daily ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 3 - Daily")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_body2
                }
                visible: string3Power.isValid
            }
            
            ListQuantityItem {
                text: qsTr("Yield Today")
                dataItem.uid: root.serviceUid + "/PV/String3/YieldToday"
                unit: VenusOS.Units_Energy_KiloWattHour
                precision: 3
                visible: string3Power.isValid
            }
            
            ListQuantityItem {
                text: qsTr("Daily Efficiency")
                dataItem.uid: root.serviceUid + "/PV/String3/DailyEfficiency"
                unit: VenusOS.Units_Percentage
                precision: 1
                visible: string3Power.isValid
            }
            
            ListQuantityItem {
                text: qsTr("Wh/Wc")
                dataItem.uid: root.serviceUid + "/PV/String3/WhPerWc"
                unit: "Wh/Wc"
                precision: 2
                visible: string3Power.isValid
            }
        }
    }
}
