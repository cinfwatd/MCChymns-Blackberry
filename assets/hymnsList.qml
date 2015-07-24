import bb.cascades 1.4
import bb.cascades.datamanager 1.2

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
                dataModel: dm
                listItemComponents: [
                    ListItemComponent {
                        
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
                        }
                    }
                ]
                
                onTriggered: {
                    if (indexPath.length == 1) {
                        var chosenItem = dataModel.data(indexPath)
                        var contentPage = hymnViewDefinition.createObject()
                        
                        contentPage.hymnNumber = chosenItem.hymn_number
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
        },
        
        AsyncDataModel {
            id: dm
            query: SqlDataQuery {
                source: "asset:///sql/MCCHymns.db"
                query: "select distinct hymn_number, _id, stanza_ from hymns_view where stanza_number = 1 order by hymn_number ASC"
                countQuery: "select count(*) from hymns_view where stanza_number = 1"
                keyColumn: "_id"
                onError: {
                    console.log("query error: " + code +", " + message)
                }
            }
            onLoaded: {
                console.log("Initial model data is loaded")
            }
        }
    ]
    onPopTransitionEnded: {
        page.destroy()
    }
    
    onCreationCompleted: {
        dm.load()
    }
}
