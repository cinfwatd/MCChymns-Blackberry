import bb.cascades 1.4

Page {
    titleBar: TitleBar {
        title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
        kind: TitleBarKind.Default
        appearance: TitleBarAppearance.Branded
    }
    
    actions: [
        ActionItem {
            title: qsTr("Goto Hymn") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.Signature
            imageSource: "asset:///images/ic_action_goto_hymn.png"
            
            onTriggered: {
                gotoHymnDialog.open()
            }
        }
    ]
    
    Container {
        
    }
}
