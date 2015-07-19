import bb.cascades 1.4

Page {
    titleBar: TitleBar {
        title: qsTr("HymnView") + Retranslate.onLocaleOrLanguageChanged
        kind: TitleBarKind.Default
        appearance: TitleBarAppearance.Branded
    }
    
    actions: [
        ActionItem {
            title: qsTr("Goto Hymn") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
        },
        
        ActionItem {
            title: qsTr(" Add to Favorites") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.Signature
        },
        
        ActionItem {
            title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
        }
    ]
    
    Container {
        
    }
}
