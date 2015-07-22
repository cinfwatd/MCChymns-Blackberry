import bb.cascades 1.4

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
            
            DropDown {
                id: fontsDropdown
                title: "Fonts"
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
                    id: small
                    text: "Small"
                    description: "14"
                    value: description
                }
                
                Option {
                    id: nornal
                    text: "Normal"
                    description: "18"
                    value: description
                }
                
                Option {
                    id: medium
                    text: "Medium"
                    description: "22"
                    value: description
                }
                
                Option {
                    id: large
                    text: "Large"
                    description: "26"
                    value: description
                }
                
                Option {
                    id: huge
                    text: "Huge"
                    description: "30"
                    value: description
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
            id: settingsUseTexture
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
