import bb.cascades 1.4

Page {
    id: page
    property int hymnNumber
    
    
    titleBar: TitleBar {
        title: qsTr("HymnView" + hymnNumber) + Retranslate.onLocaleOrLanguageChanged
        kind: TitleBarKind.Default
        appearance: TitleBarAppearance.Branded
    }
    
    attachedObjects: [
        FontStyleDefinition {
            id: fontStyle
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
        
        gestureHandlers: [
            DoubleTapHandler {
                onDoubleTapped: {
                    chorusContainer.setVisible(!chorusContainer.visible)
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
                
                Stanza {
                    stanzaNumber: "1"
                    stanza: "Jesus is good. sdjfldsfjsdf\nsdfsdafasfdasf sdfsd afsdf sdfsd\n fsldfdslfaffdaf sdfdsfdsffdaf\nsdfdsfsdfdfsdfdsfsdf"
                }
                
                Stanza {
                    stanzaNumber: "2"
                    stanza: "I love the Lord. He rescues me.\n sadfadsldf  asfsf asfdsf  lgewi dsf\n sdfdslfsaf asfl afsf s"
                }
                
                Stanza {
                    stanzaNumber: "3"
                    stanza: "I love the Lord. He rescues me.\n sdlfoowirwe wrewpqwrwenn n,cxvx sd,x, csdf\n lsjflwero weriewore  welweds sdweriew lsdfdslf .sdfds ffdsdsfsdfds."
                }
                
                Stanza {
                    stanzaNumber: "4"
                    stanza: "I love the Lord. He rescues me.\nsldkf dsaf alfkds f lkjklsdf dsl..z,dxc\n lskfdslfdslkdsaf  sdlfkwe owerw ,xcxvxvxds dsfdf\n sdljldsweorew werewr,sd dsf sdf dsf.dsfdsf"
                }
            }
        }
        
        Container {
            id: chorusContainer
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: maxWidth
            
            background: Color.White
            
            Dividr {
                bottomMargin: 0
            }

            Label {
                id: chorusTitle
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
    }
}
