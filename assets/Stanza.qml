import bb.cascades 1.4

Container {
    
    property alias stanzaNumber: stanzaNumber.text
    property alias stanza : stanza.text
    
    topMargin: ui.du(1)
    
    Container {
        
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        
        Container {
            layout: DockLayout {}
            Divider {
                verticalAlignment: VerticalAlignment.Center
            }
            layoutProperties: StackLayoutProperties {
                spaceQuota: 5
            } 
            
            preferredHeight: ui.du(6)
        }
        
        Container {
            
            Label {
                id: stanzaNumber
                text: "2"
                textStyle.base: SystemDefaults.TextStyles.TitleText
                textStyle.textAlign: TextAlign.Center
                horizontalAlignment: HorizontalAlignment.Center
            }
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }
        }
        
        Container {
            layout: DockLayout {}
            Divider {
                verticalAlignment: VerticalAlignment.Center
            }
            layoutProperties: StackLayoutProperties {
                spaceQuota: 5
            } 
            
            preferredHeight: ui.du(6)
        }
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        Label {
            id: stanza
            multiline: true
            textStyle.textAlign: TextAlign.Center
        }
    }
}
