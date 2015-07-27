import bb.cascades 1.4
import bb.cascades.datamanager 1.2

NavigationPane {
    id: navigationPane
    property bool searchBarOn: false
    function toggleSearchBar() {
        if (searchBarOn) {
            favoritesPage.titleBar = defaultBar
            searchBarOn = false
        } else {
            favoritesPage.titleBar = searchBar
            searchBarOn = true
        }
    }
    
    Page {
        id: favoritesPage
        titleBar: defaultBar
        
        Container {
            id: outerDock
            layout: DockLayout {
                
            }
            ListView {
                id: favHymns
                accessibility.description: qsTr("List of all the hymns") + Retranslate.onLocaleOrLanguageChanged
                dataModel: dm
                layout: StackListLayout {
                    headerMode: ListHeaderMode.Sticky
                }
                listItemComponents: [
                    ListItemComponent {
                      type: "header"
                      Header {
                          title: ListItemData.header
                          subtitle: ListItemData.topic
                      }  
                    },
                    ListItemComponent {
                        type: ""
                        CustomListItem {
                            id: itemRoot
                            content: Container {
                                layout: StackLayout {
                                    orientation: LayoutOrientation.LeftToRight
                                }
                                verticalAlignment: VerticalAlignment.Fill
                                rightPadding: ui.du(2)
                                leftPadding: ui.du(1)
                                
                                Label {
                                    text: ListItemData.hymn_number
                                    textStyle.base: SystemDefaults.TextStyles.SubtitleText
                                    layoutProperties: StackLayoutProperties {
                                        spaceQuota: -1
                                    }
                                    textStyle.textAlign: TextAlign.Right
                                    verticalAlignment: VerticalAlignment.Center
                                    //                                    horizontalAlignment: HorizontalAlignment.Fill
                                    preferredWidth: ui.du(8)
                                }
                                
                                Container {
                                    preferredHeight: ui.du(6)
                                    preferredWidth: ui.du(0.2)
                                    background: Color.LightGray
                                    verticalAlignment: VerticalAlignment.Center
                                    layoutProperties: StackLayoutProperties {
                                        //                                        spaceQuota: -1
                                    }
                                }
                                
                                Label {
                                    function getThis(val) {
                                        var index = val.indexOf("\\n")
                                        if (index == -1) return val
                                        return val.substr(0, val.indexOf("\\n"))
                                    }
                                    text: getThis(ListItemData.stanza_)
                                    layoutProperties: StackLayoutProperties {
                                        spaceQuota: 1
                                    }
                                    verticalAlignment: VerticalAlignment.Center
                                }
                            }
                            
                            contextActions: [
                                ActionSet {
                                    title: "Favorites"
                                    subtitle: "Remove hymns from favorites"
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
                    if (indexPath.length == 1) {
                        var chosenItem = dataModel.data(indexPath)
                        var contentPage = hymnViewDefinition.createObject()
                        
                        contentPage.hymnNumber = chosenItem.hymn_number
                        navigationPane.push(contentPage)
                    }
                }
            }
            
            Container {
                id: bgContainer
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                
                ImageView {
                    id: bgImage
                    imageSource: "asset:///images/ic_hymn_gray.png"
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Label {
                    text: qsTr("No hymn found") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: ui.palette.primary
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Label {
                    text: qsTr("Add hymn to Favorites and it will show up here.")
                    textStyle.base: SystemDefaults.TextStyles.SubtitleText
                    horizontalAlignment: HorizontalAlignment.Center
                    topMargin: ui.du(0)
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
                
                onTriggered: {
                    toggleSearchBar()
                }
            },
            
            ActionItem {
                title: qsTr("Sort By") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.OnBar
                imageSource: "asset:///images/ic_sort.png"
                
                onTriggered: {
                    sortBy.open()
                }
            },
            
            ActionItem {
                title: qsTr("Remove All") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/ic_delete_prior.png"
            },
            
            MultiSelectActionItem {
                title: "Select hymns"
                multiSelectHandler: favHymns.multiSelectHandler
            }
        ]
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: hymnViewDefinition
            source: "hymnView.qml"
        },
        
        AsyncHeaderDataModel {
            id: dm
            query: SqlHeaderDataQuery {
                source: "asset:///sql/MCCHymns.db"
                query: "SELECT DISTINCT hymn_number, _id, stanza_ FROM hymns_view WHERE stanza_number = 1 AND favourite IS NOT NULL ORDER BY hymn_number ASC"
                countQuery: "SELECT COUNT(*) FROM hymns_view WHERE stanza_number = 1 AND favourite IS NOT NULL"
                headerQuery: "select subject as header, topic, count(*) from hymns_view h, topic t, subject s " + 
                "where h.topic_id = t._id and t.subject_id = s._id and stanza_number = 1 AND favourite IS NOT NULL group by topic_id"
                keyColumn: "_id"
                onError: {
                    console.log("query error: " + code +", " + message)
                }
            }
            onLoaded: {
                console.log("Initial model data is loaded")
                bgContainer.visible = dm.childCount([]) == 0 ? true : false
            }
            
            onItemRemoved: {
                bgContainer.visible = dm.childCount([]) == 0 ? true : false
            }
            
            onItemAdded: {
                bgContainer.visible = dm.childCount([]) == 0 ? true : false
            }
            
            onItemsChanged: {
                bgContainer.visible = dm.childCount([]) == 0 ? true : false
            }
        },
        
        TitleBar {
                    id: searchBar
                    kind: TitleBarKind.TextField
                    appearance: TitleBarAppearance.Branded
                    kindProperties: TextFieldTitleBarKindProperties {
                        textField.backgroundVisible: true
                        
                        textField.hintText: "Search favorite hymns..."
                        textField.onTextChanging: {
                            console.log("Text changing = ", text)
                        }
                    }
                    
                    dismissAction: ActionItem {
                        title: "Close"
                        onTriggered: {
                            toggleSearchBar()
                        }
                    }
        },
        
        TitleBar {
            id: defaultBar
            title: qsTr("Favorites") + Retranslate.onLocaleOrLanguageChanged
            kind: TitleBarKind.Default
            appearance: TitleBarAppearance.Branded
        }
    ]
    onPopTransitionEnded: {
        page.destroy()
    }
    
    onCreationCompleted: {
        dm.load()
    }
}
