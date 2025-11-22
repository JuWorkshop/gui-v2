/*
 * Page détaillée pour Pyranomètre PYR20
 * Compatible GUI V2 - Qt 6
 * Affiche irradiance, énergie et efficience PV par string
 */

import QtQuick
import Victron.VenusOS

Page {
    id: root
    
    title: qsTr("Pyranometer & PV Efficiency")
    
    property string serviceUid: "com.victronenergy.meteo"
    
    GradientListView {
        model: ObjectModel {
            
            // ============ Section Irradiance ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Solar Irradiance")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_h2
                }
            }
            
            ListQuantityItem {
                text: qsTr("Current Irradiance")
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
            
            ListTextItem {
                text: qsTr("Last Reset")
                dataItem.uid: root.serviceUid + "/Energy/LastReset"
            }
            
            // ============ Section String 1 ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 1")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_h2
                }
            }
            
            ListTextItem {
                text: qsTr("Name")
                dataItem.uid: root.serviceUid + "/PV/String1/Name"
                secondaryText: dataItem.value || "--"
            }
            
            ListNavigationItem {
                text: qsTr("Instant Performance")
                onClicked: {
                    Global.pageManager.pushPage("/pages/settings/PyranometerStringDetail.qml", {
                        "title": qsTr("String 1 - Instant"),
                        "serviceUid": root.serviceUid,
                        "stringNumber": 1,
                        "showDaily": false
                    })
                }
            }
            
            ListNavigationItem {
                text: qsTr("Daily Performance")
                onClicked: {
                    Global.pageManager.pushPage("/pages/settings/PyranometerStringDetail.qml", {
                        "title": qsTr("String 1 - Daily"),
                        "serviceUid": root.serviceUid,
                        "stringNumber": 1,
                        "showDaily": true
                    })
                }
            }
            
            // ============ Section String 2 ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 2")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_h2
                }
                visible: string2Name.isValid
            }
            
            VeQuickItem {
                id: string2Name
                uid: root.serviceUid + "/PV/String2/Name"
            }
            
            ListTextItem {
                text: qsTr("Name")
                dataItem.uid: root.serviceUid + "/PV/String2/Name"
                secondaryText: dataItem.value || "--"
                visible: string2Name.isValid
            }
            
            ListNavigationItem {
                text: qsTr("Instant Performance")
                onClicked: {
                    Global.pageManager.pushPage("/pages/settings/PyranometerStringDetail.qml", {
                        "title": qsTr("String 2 - Instant"),
                        "serviceUid": root.serviceUid,
                        "stringNumber": 2,
                        "showDaily": false
                    })
                }
                visible: string2Name.isValid
            }
            
            ListNavigationItem {
                text: qsTr("Daily Performance")
                onClicked: {
                    Global.pageManager.pushPage("/pages/settings/PyranometerStringDetail.qml", {
                        "title": qsTr("String 2 - Daily"),
                        "serviceUid": root.serviceUid,
                        "stringNumber": 2,
                        "showDaily": true
                    })
                }
                visible: string2Name.isValid
            }
            
            // ============ Section String 3 ============
            ListItemBackground {
                height: Theme.geometry_listItem_height
                content.children: ListLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("String 3")
                    color: Theme.color_font_secondary
                    font.pixelSize: Theme.font_size_h2
                }
                visible: string3Name.isValid
            }
            
            VeQuickItem {
                id: string3Name
                uid: root.serviceUid + "/PV/String3/Name"
            }
            
            ListTextItem {
                text: qsTr("Name")
                dataItem.uid: root.serviceUid + "/PV/String3/Name"
                secondaryText: dataItem.value || "--"
                visible: string3Name.isValid
            }
            
            ListNavigationItem {
                text: qsTr("Instant Performance")
                onClicked: {
                    Global.pageManager.pushPage("/pages/settings/PyranometerStringDetail.qml", {
                        "title": qsTr("String 3 - Instant"),
                        "serviceUid": root.serviceUid,
                        "stringNumber": 3,
                        "showDaily": false
                    })
                }
                visible: string3Name.isValid
            }
            
            ListNavigationItem {
                text: qsTr("Daily Performance")
                onClicked: {
                    Global.pageManager.pushPage("/pages/settings/PyranometerStringDetail.qml", {
                        "title": qsTr("String 3 - Daily"),
                        "serviceUid": root.serviceUid,
                        "stringNumber": 3,
                        "showDaily": true
                    })
                }
                visible: string3Name.isValid
            }
        }
    }
}
