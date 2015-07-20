import bb.cascades 1.4

NavigationPane {
    id: navigationPane
    
    Page {
        titleBar: TitleBar {
            title: qsTr("Favorites") + Retranslate.onLocaleOrLanguageChanged
            kind: TitleBarKind.Default
            appearance: TitleBarAppearance.Branded
        }
        
        Container {
            
        }
        
        actions: [
            ActionItem {
                title: qsTr("Goto Hymn") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.OnBar
                imageSource: "asset:///images/ic_action_goto_hymn.png"
            },
            
            ActionItem {
                title: qsTr("Search") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.Signature
                imageSource: "asset:///images/ic_search.png"
            },
            
            ActionItem {
                title: qsTr("Sort By") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.OnBar
                imageSource: "asset:///images/ic_sort.png"
            },
            
            ActionItem {
                title: qsTr("Remove All") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/ic_delete_prior.png"
            }
        ]
    }
}
