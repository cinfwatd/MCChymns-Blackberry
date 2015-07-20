import bb.cascades 1.4

Page {
    titleBar: TitleBar {
        title: qsTr("About") + Retranslate.onLocaleOrLanguageChanged
        kind: TitleBarKind.Default
        appearance: TitleBarAppearance.Branded
    
    }
    
    actions: [
        ActionItem {
            title: qsTr("Goto Hymn") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.Signature
            imageSource: "asset:///images/ic_action_goto_hymn.png"
        }
    ]
    
    Container {
//        layout: DockLayout {}
        
        Container {
            id: header
            layout: DockLayout {}
            preferredWidth: maxWidth
            topPadding: 20
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            
            ImageView {
                horizontalAlignment: HorizontalAlignment.Left
                imageSource: "asset:///images/icon.png"
                accessibility.description: "Bitrient logo"
                accessibility.name: accessibility.description
            }
            
            Label {
                horizontalAlignment: HorizontalAlignment.Right
                text: "0.9.6 Beta"
            }
        }
        
        Container {
            id: main
            layout: DockLayout {}
            background: Color.create("#C9004A")
            preferredWidth: maxWidth
            preferredHeight: maxHeight
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                Label {
                    id: mcchymns
                    text: qsTr("MCCHymns") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.BigText
                    preferredWidth: maxWidth
                    textStyle.textAlign: TextAlign.Center
                    textStyle.color: Color.White
                    bottomMargin: 0
                }
                Label {
                    id: ssands
                    text: qsTr("Sacred songs and solos") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: Color.create("#DCDCDC")
                    preferredWidth: maxWidth
                    textStyle.textAlign: TextAlign.Center
                    topMargin: 0
                }
                Label {
                    id: twelveHundredHymns
                    multiline: true
                    autoSize.maxLineCount: 2
                    text: qsTr("Twelve hundred hymns\nas compiled under the direction of") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.BodyText
                    textStyle.color: Color.create("#C0C0C0")
                    preferredWidth: maxWidth
                    textStyle.textAlign: TextAlign.Center
                    bottomMargin: 0
                }
                Label {
                    id: iraDsankey
                    text: qsTr("IRA D. SANKEY") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: Color.create("#DCDCDC")
                    preferredWidth: maxWidth
                    textStyle.textAlign: TextAlign.Center
                    topMargin: 0
                }
            }
            
        }
        
        Container {
            id: footer
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            preferredWidth: maxWidth
            topPadding: 20
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            
            Label {
                id: developer
                text: qsTr("Bitrient Inc.    2015") + Retranslate.onLocaleOrLanguageChanged
                textStyle.base: SystemDefaults.TextStyles.SubtitleText
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }
                textStyle.textAlign: TextAlign.Right
                rightMargin: 150
            }
            
            Label {
                id: copyright
                text: "All Rights Reserved"
                textStyle.base: SystemDefaults.TextStyles.SubtitleText
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }
                textStyle.textAlign: TextAlign.Left
            }
        }
    }
}
