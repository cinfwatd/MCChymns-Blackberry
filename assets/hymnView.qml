import bb.cascades 1.4
import bb.system 1.2
import com.bitrient.data 1.0

Page {
    id: page
    property int hymnNumber
    property bool chorusPresent: false
    
    property int selectedHymn: parent.selectedHymnNumber
    
    titleBar: TitleBar {
        title: qsTr("HymnView" + hymnNumber) + Retranslate.onLocaleOrLanguageChanged
        kind: TitleBarKind.Default
        appearance: TitleBarAppearance.Branded
    }
    
    attachedObjects: [
        FontStyleDefinition {
            id: fontStyle
        },
        
        ImagePaintDefinition {
            id: backgroundImage
            repeatPattern: RepeatPattern.XY
            imageSource: "asset:///images/paper_texture.amd"
        },
        SystemToast {
            id: alert
            body: qsTr("Double tap to hide or show chorus pane.") + Retranslate.onLocaleOrLanguageChanged
            button.enabled: true
            button.label: qsTr("Got It") + Retranslate.onLocaleOrLanguageChanged
            
            onFinished: {
                var isClicked = buttonSelection()
                
                if (isClicked) {
                    appSettings.hideChorusInfo = true
                } 
            }
        },
        ComponentDefinition {
            id: stanzaTpl
            source: "asset:///Stanza.qml"
        },
        CustomSqlDataSource {
            id: asyncDataSource
            source: "sql/MCCHymns.db"
            query: "SELECT hymn_number, stanza_number, stanza_, favourite FROM hymns_view WHERE hymn_number = 577 ORDER BY stanza_number ASC"
            property int localHymnNumber
            
            onDataLoaded: {
                if (data.length > 0) {
                    
                    for (var i = 0; i < data.length; i++) {
                        console.log(data[i].stanza_number + ": " +data[i].stanza_)
                        
                        if (!data[i].stanza_number) {
                            chorus.text = data[i].stanza_.replace(/\\n/g, "\n")
                            chorusPresent = true
                            
                            
                            console.log("asdf" + hymnNumber)
                            
                        } 
                        else {
                            var stanza = stanzaTpl.createObject()
                            stanza.stanzaNumber = data[i].stanza_number
                            stanza.stanza = data[i].stanza_.replace(/\\n/g, "\n")
                            
                            stanzasContainer.add(stanza)
                        }
                    }
                }
            }
        }
    ]
    
    actions: [
//        ActionItem {
//            title: qsTr("Open Hymn") + Retranslate.onLocaleOrLanguageChanged
//            ActionBar.placement: ActionBarPlacement.InOverflow
//            imageSource: "asset:///images/ic_show_dialpad.png"
//            
//            onTriggered: {
//                gotoHymnDialog.open()
//            }
//        },
        
        ActionItem {
            title: qsTr(" Add to Favorites") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.Signature
            imageSource: "asset:///images/ic_action_favorite_off.png"
        }
    ]
    
    Container {
        id: hymnContainer
        layout: DockLayout {}
        topPadding: ui.du(1)
        rightPadding: ui.du(3)
        bottomPadding: ui.du(3)
        leftPadding: ui.du(3)
        
        background: appSettings.useBackgroundTexture ? backgroundImage.imagePaint : Color.create(appSettings.backgroundColor)
        
        gestureHandlers: [
            DoubleTapHandler {
                onDoubleTapped: {
                    chorusContainer.setVisible(!chorusContainer.visible && chorusPresent)
                }
            }
        ]
        ScrollView {
            accessibility.name: qsTr("Hymn scrollview")
            preferredHeight: parent.maxHeight
            
            Container {
                id: stanzasContainer
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                verticalAlignment: VerticalAlignment.Top
                
//                Stanza {
//                    stanzaNumber: "1"
//                    stanza: "Jesus is good. sdjfldsfjsdf\nsdfsdafasfdasf sdfsd afsdf sdfsd\n fsldfdslfaffdaf sdfdsfdsffdaf\nsdfdsfsdfdfsdfdsfsdf"
//                }
            }
        }
        
        Container {
            id: chorusContainer
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            visible: chorusPresent
            
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: maxWidth
            
            background: hymnContainer.background
            
            Dividr {
                bottomMargin: 0
            }

            Label {
                id: chorusTitle
                textFormat: TextFormat.Auto
                text: qsTr("Chorus") + Retranslate.onLocaleOrLanguageChanged
                textStyle.base: fontStyle.style
                horizontalAlignment: HorizontalAlignment.Center
                topMargin: ui.du(1)
            }
            
            Dividr {
                topMargin: ui.du(1)
                bottomMargin: ui.du(1)
            }
            
            ScrollView {
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    id: chorus
                    textFormat: TextFormat.Auto
                    multiline: true
                    textStyle.base: fontStyle.style
                    text: "Jesus my savior to bethlehem came\nBorn in a manger to sorrow and shame\nOh it was wonderfull blessed be His name."
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
    }
    
    onCreationCompleted: {
//        settingsFontSize = appSettings.fontSize
        if (!appSettings.hideChorusInfo) {
            alert.show()
        }
        
        console.log("Hymn NUmber passed: " + selectedHymn)
        
//        asyncDataSource.localHymnNumber = hymnNumber
        asyncDataSource.load()
    }
}
