import bb.cascades 1.4
import bb.cascades.datamanager 1.2

NavigationPane {
    id: navigationPane
    property bool searchBarOn: false
    function toggleSearchBar() {
        if (searchBarOn) {
            hymnsPage.titleBar = defaultBar
            searchBarOn = false
        } else {
            hymnsPage.titleBar = searchBar
            searchBarOn = true
        }
    }
    
    Page {
        id: hymnsPage
        titleBar: defaultBar
        
        Container {
            id: outerDock
            layout: DockLayout {
                
            }
            ListView {
                id: hymns
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
                                    preferredWidth: ui.du(8)
                                }
                                
                                // divider
                                Container {
                                    preferredHeight: ui.du(6)
                                    preferredWidth: ui.du(0.2)
                                    background: Color.LightGray
                                    verticalAlignment: VerticalAlignment.Center
                                }
                                
                                Label {
                                    function getFirstLine(val) {
                                        var index = val.indexOf("\\n")
                                        if (index == -1) return val
                                        return val.substr(0, val.indexOf("\\n"))
                                    }
                                    text: getFirstLine(ListItemData.stanza_)
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
                    if (indexPath.length > 1) {
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
                    text: qsTr("Loading hymns ...") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: ui.palette.primary
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
        
        actions: [
            ActionItem {
                title: qsTr("Open hymn") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/ic_show_dialpad.png"
                
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
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/ic_sort.png"
                
                onTriggered: {
                    sortBy.open()
                }
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
                query: "select distinct hymn_number, _id, stanza_, topic_id from hymns_view where stanza_number = 1 order by hymn_number ASC"
                countQuery: "select count(*) from hymns_view where stanza_number = 1"
                headerQuery: "select subject as header, topic, count(*) from hymns_view h, topic t, subject s " + 
                    "where h.topic_id = t._id and t.subject_id = s._id and stanza_number = 1 group by topic_id"
                keyColumn: "_id"
                onError: {
                    console.log("query error: " + code +", " + message)
                }
            }
            onLoaded: {
                console.log("Initial model data is loaded" )
                bgContainer.visible = dm.childCount([]) == 0 ? true : false
            }
            
            onItemsChanged: {
                console.log("Items changed")
            }
        },
        TitleBar {
            id: searchBar
            kind: TitleBarKind.TextField
            appearance: TitleBarAppearance.Branded
            kindProperties: TextFieldTitleBarKindProperties {
                textField.backgroundVisible: true
                
                textField.hintText: "Search hymns..."
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
            title: qsTr("MCCHymns") + Retranslate.onLocaleOrLanguageChanged
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
