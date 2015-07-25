import bb.cascades 1.4
import bb.system 1.2

Dialog {
    signal sortTypeSelected(int sortType)
    property int selectedSortType : -1
    
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        background: Color.create(0.0, 0.0, 0.0, 0.5)
        
        layout: DockLayout {}
        
        onTouch: {
            if (event.propagationPhase == PropagationPhase.AtTarget) {
                
                if (event.touchType == TouchType.Up) {
                    close()
                }
            }
        }
        
        Container {
            maxHeight: ui.du(59.7)
            maxWidth: ui.du(59.7)
            topPadding: ui.du(5)
            bottomPadding: ui.du(3)
            preferredWidth: maxWidth
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            background: Color.White
            
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                leftPadding: ui.du(4)
                bottomPadding: ui.du(3)
                Label {
                    text: "Sort By"
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.fontWeight: FontWeight.W500
                }
            }
            
            Container {
                id: hymnNumberContainer
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                preferredHeight: ui.du(10)
                leftPadding: ui.du(4)
                
                Label {
                    text: "Hymn number"
                    textStyle.base: SystemDefaults.TextStyles.PrimaryText
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Center
                    
                    onTouch: {
                        if (event.propagationPhase == PropagationPhase.AtTarget) {
                            if (event.touchType == TouchType.Down) {
                                hymnNumberContainer.background = Color.LightGray
                            }
                            if (event.touchType == TouchType.Up) {
                                hymnNumberContainer.resetBackground()
                                
                                sortTypeSelected(0)
                            }
                        }
                    } 
                }
            }
            
            Container {
                id: firstLinesContainer
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                preferredHeight: ui.du(10)
                leftPadding: ui.du(4)
                
                Label {
                    text: "First lines"
                    textStyle.base: SystemDefaults.TextStyles.PrimaryText
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Center
                    
                    onTouch: {
                        if (event.propagationPhase == PropagationPhase.AtTarget) {
                            if (event.touchType == TouchType.Down) {
                                firstLinesContainer.background = Color.LightGray
                            }
                            if (event.touchType == TouchType.Up) {
                                firstLinesContainer.resetBackground()
                                sortTypeSelected(1)
                            }
                        }
                    } 
                }
            }
        }
    }
    
    onSortTypeSelected: {
        console.log("Sort type selected = ", sortType)
        selectedSortType = sortType
    }
}