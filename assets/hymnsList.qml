import bb.cascades 1.3

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
                id: hymns
                accessibility.description: qsTr("List of all the hymns") + Retranslate.onLocaleOrLanguageChanged
                dataModel: XmlDataModel {
                    source: "data.xml"
                }
                
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        
                        StandardListItem {
                            id: itemRoot
                            title: ListItemData.name
                            description: ListItemData.description
                            imageSource: "asset:///images/ic_action_bulb.png"
                            
                            contextActions: [
                                ActionSet {
                                    title: "Contact"
                                    actions: [
                                        DeleteActionItem {
                                            title: "Remove"
                                            enabled: true
                                            imageSource: "asset:///images/ic_delete.png"
                                            
                                            onTriggered: {
                                                var listView = itemRoot.ListItem.view
                                                listView.dataModel.removeIndex(0)
                                            }
                                        }
                                    ]
                                }
                            ]
                        }
                    }
                ]
                multiSelectAction: MultiSelectActionItem {
                    
                }
                
                
                
                multiSelectHandler {
                    actions: [
                        ActionItem {
                            imageSource: "asset:///images/ic_delete.png"
                            title: "Remove"
                        }
                    ]
                    
                    
                    // Set the initial status text of multiple 
                    // selection mode. When the mode is first 
                    // enabled, no items are selected.
                    status: "None selected"
                }
                
                // When a list item is selected or deselected, 
                // update the status text to reflect the number
                // of items that are currently selected
                onSelectionChanged: {
                    if (selectionList().length > 1) {
                        multiSelectHandler.status = selectionList().length +
                        " items selected";
                    } else if (selectionList().length == 1) {
                        multiSelectHandler.status = "1 item selected";
                    } else {
                        multiSelectHandler.status = "None selected";
                    }
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
            ,
            MultiSelectActionItem {
                title: "Select hymns"
                multiSelectHandler: hymns.multiSelectHandler
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
