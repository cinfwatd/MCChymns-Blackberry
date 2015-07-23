import bb.cascades 1.4

NavigationPane {
    id: navigationPane
    
    Page {
        titleBar: TitleBar {
            title: qsTr("MCCHymns") + Retranslate.onLocaleOrLanguageChanged
            kind: TitleBarKind.Default
            appearance: TitleBarAppearance.Branded
               
        }
        
        Container {
            ListView {
                id: hymnsList
                accessibility.description: qsTr("List of all the hymns") + Retranslate.onLocaleOrLanguageChanged
                dataModel: XmlDataModel {
                    source: "data.xml"
                }
                
                onTriggered: {
                    if (indexPath.length > 1) {
                        var chosenItem = dataModel.data(indexPath)
                        var contentPage = hymnViewDefinition.createObject()
                        
//                        contentPage.itemPageTitle = chosenItem.name
                        navigationPane.push(contentPage)
                    }
                }
            }
        }
        
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
                title: qsTr("Search") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.Signature
                imageSource: "asset:///images/ic_search.png"
            },
            
            ActionItem {
                title: qsTr("Sort By") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.OnBar
                imageSource: "asset:///images/ic_sort.png"
            }
        ]
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: hymnViewDefinition
            source: "hymnView.qml"
        }
    ]
    onPopTransitionEnded: {
        page.destroy()
    }
}
