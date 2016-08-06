/*
 * Copyright (c) 2011-2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.4

TabbedPane {
    id: tappedPane
    showTabsOnActionBar: false
    
    attachedObjects: [
        GotoHymnDialog {
            id: gotoHymnDialog
        },
        
        Sheet {
            id: settingsSheet
            content: Settings {
                titleBar: TitleBar {
                    title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
                    kind: TitleBarKind.Default
                    appearance: TitleBarAppearance.Branded
                    dismissAction: ActionItem {
                        title: "CLOSE"
                        onTriggered: {
                            settingsSheet.close()
                        }
                    }
                }
            }
        },
        
        Sheet {
            id: aboutSheet
            content: About {
                titleBar: TitleBar {
                    title: qsTr("About") + Retranslate.onLocaleOrLanguageChanged
                    kind: TitleBarKind.Default
                    appearance: TitleBarAppearance.Branded
                    dismissAction: ActionItem {
                        title: "CLOSE"
                        onTriggered: {
                            aboutSheet.close()
                        }
                    }
                }
            }
        },
        
        SortByDialog {
            id: sortBy
        }
    ]
    
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            title: "About"
            imageSource: "asset:///images/ic_info.png"
            onTriggered: {
                aboutSheet.open()
            }
        }
        
        settingsAction: SettingsActionItem {
            imageSource: "asset:///images/ic_settings.png"
            onTriggered: {
                settingsSheet.open()
            }
        }
        
//        actions: [
//            ActionItem {
//                title: qsTr("Feedback") + Retranslate.onLocaleOrLanguageChanged
//                ActionBar.placement: ActionBarPlacement.OnBar
//                imageSource: "asset:///images/ic_feedback.png"
//            }
//        ]
    }
    
    Tab {
        id: hymnsList
        title: qsTr("MCCHymns") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/ic_hymns.png"
        
        delegate: Delegate {
            id: hymnsDelegate
            source: "hymnsList.qml"
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.Default
    }
    
    Tab {
        id: favoritesList
        title: qsTr("Favorites") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/ic_action_favorite_off.png"
        
        delegate: Delegate {
            id: favoritesDelegate
            source: "favoritesList.qml"
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.Default
    }
    
    onCreationCompleted: {
        if (appSettings.startFavorites) {
            activeTab = favoritesList
        }
    }
}
