import bb.cascades 1.4
import bb.system 1.2

Page {
    function setDropDownOptionByValue(dropdown, value) {
        for (var i = 0; i < dropdown.options.length; i++) {
            var o = dropdown.options[i];
            if (o.value == value) {
                dropdown.setSelectedOption(o);
                return true;
            }
        }
        return false;
    }
    
    titleBar: TitleBar {
        title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
        kind: TitleBarKind.Default
        appearance: TitleBarAppearance.Branded
    }
    
    attachedObjects: [
        SystemToast {
            id: alert
            body: "Font and background color should not be the same"
        }
    ]
    
    ScrollView {
        accessibility.name: qsTr("Settings scrollView")
        Container {
            topPadding: ui.du(3)
            rightPadding: topPadding
            bottomPadding: topPadding
            leftPadding: topPadding
            
            Container {
                id: settingsFavorites
                layout: DockLayout {}
                
                leftPadding: ui.du(2)
                rightPadding: leftPadding
                
                horizontalAlignment: HorizontalAlignment.Fill
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Left
                    Label {
                        text: qsTr("Favorites") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.TitleText
                        bottomMargin: ui.du(0)
                    }
                    Label {
                        text: qsTr("Show favorites on start") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.SubtitleText
                        topMargin: ui.du(0)
                    }
                }
                
                ToggleButton {
                    horizontalAlignment: HorizontalAlignment.Right
                    onCheckedChanged: {
                        appSettings.startFavorites = checked
                    }
                    onCreationCompleted: {
                        checked = appSettings.startFavorites
                    }
                }
            }
            
            Label {
                text: qsTr("Hymn settings") + Retranslate.onLocaleOrLanguageChanged
                textStyle.base: SystemDefaults.TextStyles.SubtitleText
            }
            
            Divider {}
            
            Container {
                id: fonts
                leftPadding: ui.du(2)
                rightPadding: leftPadding
                
//                DropDown {
//                    id: fontsDropdown
//                    title: "Fonts"
//                    enabled: true
//                    
//                    Option {
//                        id: lilac
//                        text: "sdfsdf"
//                        
//                    }
//                }

                Picker {
                    id: fontsPicker
                    property string myValue: ""
                    title: "Fonts"
                    description: myValue
                    
                    rootIndexPath: []
                    dataModel: XmlDataModel {
                        id: fontsDataModel
                        source: "asset:///xml/fonts.xml"
                    }
                    
                    pickerItemComponents: [
                        PickerItemComponent {
                            type: "fontItem"
                            content: Label {
                                text: pickerItemData.name
                                textStyle{
                                    base: sfontStyle.style
                                    fontFamily: pickerItemData.name
                                }
                                attachedObjects: [
                                    FontStyleDefinition {
                                        id: sfontStyle
                                        color: Color.Black
                                        fontSize: FontSize.Default
                                    }
                                ]
                            }
                        }
                    ]
                    
                    onCreationCompleted: {
                        var index = 0
                        switch (appSettings.font) {
                            case "Lilac-alaria":
                                index = 0
                                break
                            case "Calligraffiti":
                                index = 1
                                break
                            case "Andada":
                                index = 2
                                break
                            case "Underwood":
                                index = 3
                                break
                                
                        }  
                        fontsPicker.select(0, index)
                    }
                    
                    onSelectedValueChanged: {
                        var indexPath = fontsPicker.selectedIndex(0)
                        
                        var fontName = ""
                        switch (indexPath) {
                            case 0:
                                fontName = "Lilac-malaria"
                                break
                            case 1:
                                fontName = "Calligraffiti"
                                break
                            case 2:
                                fontName = "Andada"
                                break
                            case 3:
                                fontName = "Underwood"
                                break
                        }
                        
                        myValue = fontName
                        appSettings.font = fontName
                    }
                }
            
            }
            
            Divider {}
            
            Container {
                id: fontSize
                leftPadding: ui.du(2)
                rightPadding: leftPadding
                
                DropDown {
                    id: fontSizeDropdown
                    title: "Font Size"
                    enabled: true
                    
                    Option {
                        id: xsmall
                        text: "Xtra Small"
                        //                    description: "10"
                        value: FontSize.XSmall
                    }
                    
                    Option {
                        id: small
                        text: "Small"
                        //                    description: "14"
                        value: FontSize.Small
                    }
                    
                    Option {
                        id: medium
                        text: "Medium"
                        //                    description: "18"
                        value: FontSize.Medium
                    }
                    
                    Option {
                        id: large
                        text: "large"
                        //                    description: "22"
                        value: FontSize.Large
                    }
                    
                    Option {
                        id: xlarge
                        text: "Xtra Large"
                        //                    description: "26"
                        value: FontSize.XLarge
                    }
                    
                    Option {
                        id: huge
                        text: "Huge"
                        //                    description: "30"
                        value: FontSize.XXLarge
                    }
                    
                    onCreationCompleted: {
                        setDropDownOptionByValue(fontSizeDropdown, appSettings.fontSize)
                    }
                    
                    onSelectedOptionChanged: {
                        appSettings.fontSize = selectedValue
                    }
                }
            }
            
            Divider {}
            
            Container {
                id: fontColor
                leftPadding: ui.du(2)
                rightPadding: leftPadding
                
                Picker {
                    id: fontColorPicker
                    property string myValue: ""
                    title: "Font Color"
                    description: myValue
                    
                    rootIndexPath: []
                    dataModel: XmlDataModel {
                        source: "asset:///xml/colors.xml"
                    }
                    
                    pickerItemComponents: [
                        
                        PickerItemComponent {
                            type: "colorItem"
                            
                            content: Container {
                                layout: StackLayout {
                                    orientation: LayoutOrientation.LeftToRight
                                
                                }
                                Container {
                                    preferredHeight: ui.du(6.5)
                                    preferredWidth: ui.du(20)
                                    background: Color.create(pickerItemData.color)
                                }
                                Label {
                                    text: pickerItemData.name
                                }
                            }
                        }
                    ]
                    
                    onCreationCompleted: {
                        fontColorPicker.select(0, getIndexFromColors(appSettings.fontColor, 1))
                    }
                    
                    onSelectedValueChanged: {
                        var indexPath = fontColorPicker.selectedIndex(0)
                        
                        var result = getColorFromXML(indexPath)
                        myValue = result.name
                        
                        if (result.color === appSettings.backgroundColor) {
                            alert.show()
                        }
                        appSettings.fontColor = result.color
                    }
                }
            }
            
            Divider{}
            
            
            Container {
                id: backgroundColor
                leftPadding: ui.du(2)
                rightPadding: leftPadding
                
                Picker {
                    id: bgColorPicker
                    property string myValue: ""
                    title: "Background Color"
                    description: myValue
                    
                    rootIndexPath: []
                    dataModel: XmlDataModel {
                        source: "asset:///xml/colors.xml"
                    }
                    
                    pickerItemComponents: [
                        
                        PickerItemComponent {
                            type: "colorItem"
                            
                            content: Container {
                                layout: StackLayout {
                                    orientation: LayoutOrientation.LeftToRight
                                
                                }
                                Container {
                                    preferredHeight: ui.du(6.5)
                                    preferredWidth: ui.du(20)
                                    background: Color.create(pickerItemData.color)
                                }
                                Label {
                                    text: pickerItemData.name
                                }
                            }
                        }
                    ]
                    
                    onCreationCompleted: {
                        bgColorPicker.select(0, getIndexFromColors(appSettings.backgroundColor, 31))
                    }
                    
                    onSelectedValueChanged: {
                        var indexPath = bgColorPicker.selectedIndex(0)
                        
                        var result = getColorFromXML(indexPath)
                        myValue = result.name
                        
                        if (result.color === appSettings.fontColor) {
                            alert.show()
                        }
                        appSettings.backgroundColor = result.color
                    }
                }
            }
            
            Divider{}
            
            Container {
                id: useTexture
                layout: DockLayout {}
                
                leftPadding: ui.du(2)
                rightPadding: leftPadding
                
                horizontalAlignment: HorizontalAlignment.Fill
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Left
                    Label {
                        text: qsTr("Background Texture") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.TitleText
                        bottomMargin: ui.du(0)
                    }
                    Label {
                        text: qsTr("Use textured background") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.SubtitleText
                        topMargin: ui.du(0)
                    }
                }
                
                ToggleButton {
                    id: settings
                    horizontalAlignment: HorizontalAlignment.Right
                    onCheckedChanged: {
                        appSettings.useBackgroundTexture = checked
                    }
                    onCreationCompleted: {
                        checked = appSettings.useBackgroundTexture
                    }
                }
            }
        }
    }
    
    function getColorFromXML(indexPath) {
        var name = ""
        var color = ""
        
        switch (indexPath) {
            case 0: name = "Azure"; color="#F0FFFF"; break;
            case 1: name = "Brown"; color="#62371A"; break; 
            case 2: name = "Burly Wood"; color="#DEB887"; break; 
            case 3: name = "Black"; color="#000000"; break; 
            case 4: name = "Bisque"; color="#FFE4C4"; break; 
            case 5: name = "Beige"; color="#F5F5DC"; break; 
            case 6: name = "Blue Violet"; color="#8A2BE2"; break; 
            case 7: name = "Cadet Blue"; color="#5F9EA0"; break; 
            case 8: name = "Chocolate"; color="#D2691E"; break; 
            case 9: name = "Cornflower Blue"; color="#6495ED"; break; 
            case 10: name = "Cornsilk"; color="#FFF8DC"; break; 
            case 11: name = "Crimson"; color="#DC143C"; break; 
            case 12: name = "Dark Cyan"; color="#008B8B"; break; 
            case 13: name = "Dark GoldenRod"; color="#B8860B"; break; 
            case 14: name = "Dark Grey"; color="#A9A9A9"; break; 
            case 15: name = "Dark Khaki"; color="#BDB76B"; break; 
            case 16: name = "Dark Olive Green"; color="#556B2F"; break; 
            case 17: name = "Gold"; color="#FFD700"; break; 
            case 18: name = "Golden Rod"; color="#DAA520"; break; 
            case 19: name = "Grey"; color="#808080"; break; 
            case 20: name = "Maroon"; color="#800000"; break; 
            case 21: name = "Medium Purple"; color="#9370DB"; break; 
            case 22: name = "Olive"; color="#808000"; break; 
            case 23: name = "Olive Drab"; color="#6B8E23"; break; 
            case 24: name = "Plum"; color="#DDA0DD"; break; 
            case 25: name = "Powder Blue"; color="#B0E0E6"; break; 
            case 26: name = "Rosy Brown"; color="#BC8F8F"; break; 
            case 27: name = "Saddle Brown"; color="#8B4513"; break; 
            case 28: name = "SandyBrown"; color="#F4A460"; break; 
            case 29: name = "Tan"; color="#D2B48C"; break; 
            case 30: name = "Tomato"; color="#FF6347"; break; 
            case 31: name = "Wheat"; color="#F5DEB3"; break; 
            case 32: name = "White"; color="#FFFFFF"; break;
        }
        
        return {
            "name": name,
            "color": color
        }
    }
    
    function getIndexFromColors(activeColor, defaultIndex) {
        
        var xmlColors = ["#F0FFFF", "#62371A","#DEB887","#000000","#FFE4C4",
        "#F5F5DC","#8A2BE2","#5F9EA0","#D2691E","#6495ED","#FFF8DC",
        "#DC143C","#008B8B","#B8860B","#A9A9A9","#BDB76B","#556B2F",
        "#FFD700","#DAA520","#808080","#800000","#9370DB","#808000",
        "#6B8E23","#DDA0DD","#B0E0E6","#BC8F8F","#8B4513","#F4A460",
        "#D2B48C","#FF6347","#F5DEB3","#FFFFFF"]
        
        for(var i = 0; i < xmlColors.length; i++) {
            
            if (xmlColors[i] === activeColor) {
                return i
            }
        }
        
        return defaultIndex
    }
}
