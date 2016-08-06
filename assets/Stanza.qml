import bb.cascades 1.4

Container {
    
    property alias stanzaNumber: stanzaNumber.text
    property alias stanza : stanza.text
        
    topMargin: ui.du(1)
    
    attachedObjects: [
        FontStyleDefinition {
            id: fontStyle
        }
    ]
    
    Container {
        
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        
        Container {
            layout: DockLayout {}
            Dividr {
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
            
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.base: fontStyle.style
            }
            
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }
        }
        
        Container {
            layout: DockLayout {}
            Dividr {
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
            
            textStyle {
                base: fontStyle.style
                textAlign: TextAlign.Center
            }
        }
    }
}
