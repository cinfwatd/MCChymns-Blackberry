import bb.cascades 1.4

Page {
    titleBar: TitleBar {
        title: qsTr("HymnView") + Retranslate.onLocaleOrLanguageChanged
        kind: TitleBarKind.Default
        appearance: TitleBarAppearance.Branded
    }
    
    attachedObjects: [
        TextStyleDefinition {
            id: fontStyle
            color: Color.create("#62371A");
        }
    ]
    
    actions: [
        ActionItem {
            title: qsTr("Goto Hymn") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
            imageSource: "asset:///images/ic_action_goto_hymn.png"
            
            onTriggered: {
                gotoHymnDialog.open()
            }
        },
        
        ActionItem {
            title: qsTr(" Add to Favorites") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.Signature
            imageSource: "asset:///images/ic_action_favorite_off.png"
        },
        
        ActionItem {
            title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
            imageSource: "asset:///images/ic_settings.png"
        }
    ]
    
    Container {
        id: hymnContainer
        layout: DockLayout {}
        topPadding: ui.du(1)
        rightPadding: ui.du(3)
        bottomPadding: ui.du(3)
        leftPadding: ui.du(3)
        
        Container {
            id: stanzasContainer
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            verticalAlignment: VerticalAlignment.Top
            
            Stanza {
                stanzaNumber: "1"
                stanza: "Jesus is good."
            }
            
            Stanza {
                stanzaNumber: "2"
                stanza: "I love the Lord. He rescues me."
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
            
            Divider {
                bottomMargin: 0
            }

            Label {
                id: chorusTitle
                text: qsTr("Chorus") + Retranslate.onLocaleOrLanguageChanged
                textStyle.color: fontStyle.color
                textStyle.base: SystemDefaults.TextStyles.BodyText
                horizontalAlignment: HorizontalAlignment.Center
                topMargin: ui.du(1)
            }
            
            Divider {
                topMargin: ui.du(1)
                bottomMargin: ui.du(duValue)
            }
            
            ScrollView {
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    id: chorus
                    textFormat: TextFormat.Auto
                    multiline: true
                    textStyle.textAlign: TextAlign.Center
                    textStyle.color: fontStyle.color
                    textStyle.base: SystemDefaults.TextStyles.BodyText
                    text: "Jesus my savior to bethlehem came\nBorn in a manger to sorrow and shame\nOh it was wonderfull blessed be His name."
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
    }
}
