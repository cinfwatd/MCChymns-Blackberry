import bb.cascades 1.4

Page {
    id: about
    titleBar: TitleBar {
        title: qsTr("About") + Retranslate.onLocaleOrLanguageChanged
        kind: TitleBarKind.Default
        appearance: TitleBarAppearance.Branded
    
    }
    
    Container {
        
        Container {
            id: header
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Fill
            topPadding: ui.du(2)
            rightPadding: topPadding
            bottomPadding: topPadding
            leftPadding: topPadding
            
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
            preferredWidth: Infinity
            preferredHeight: Infinity
            
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Center
                
                Label {
                    id: mcchymns
                    text: qsTr("MCCHymns") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.BigText
                    textStyle.textAlign: TextAlign.Center
                    textStyle.color: Color.White
                    bottomMargin: 0
                    horizontalAlignment: HorizontalAlignment.Center
                }
                Label {
                    id: ssands
                    text: qsTr("Sacred songs and solos") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: Color.create("#DCDCDC")
                    textStyle.textAlign: TextAlign.Center
                    topMargin: 0
                    horizontalAlignment: HorizontalAlignment.Center
                }
                Label {
                    id: twelveHundredHymns
                    multiline: true
                    autoSize.maxLineCount: 2
                    text: qsTr("Twelve hundred hymns\nas compiled under the direction of") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.BodyText
                    textStyle.color: Color.create("#C0C0C0")
                    textStyle.textAlign: TextAlign.Center
                    bottomMargin: 0
                    horizontalAlignment: HorizontalAlignment.Center
                }
                Label {
                    id: iraDsankey
                    text: qsTr("IRA D. SANKEY") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: Color.create("#DCDCDC")
                    textStyle.textAlign: TextAlign.Center
                    topMargin: 0
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
            
        }
        
        Container {
            id: footer
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            topPadding: ui.du(2)
            rightPadding: topPadding
            bottomPadding: topPadding
            leftPadding: topPadding
            
            Label {
                id: developer
                text: qsTr("Bitrient Inc.    2015") + Retranslate.onLocaleOrLanguageChanged
                textStyle.base: SystemDefaults.TextStyles.SubtitleText
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }
                textStyle.textAlign: TextAlign.Right
                rightMargin: ui.du(10)
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