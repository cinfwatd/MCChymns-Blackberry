import bb.cascades 1.4

Container {
    id: customButton
    background: Color.White
    preferredHeight: ui.du(7)
    preferredWidth: ui.du(30)
    layout: DockLayout {
    }
    signal clicked
    property alias text: button.text
    property alias label: button
    property alias imageSource: image.imageSource
    property bool highlightable: true
    
    Label {
        id: button
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
    }
    
    ImageView {
        id: image
        imageSource: imageSource
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        scalingMethod: ScalingMethod.AspectFit
        preferredHeight: ui.du(6)
    }
    
    onTouch: {
        if (event.isDown() || event.isMove()) {
            // Focused, change the background
            if (highlightable)
                customButton.background = Color.create("#DCDCDC");
        } else {
            customButton.resetBackground()
            clicked()
        }
    }
}
