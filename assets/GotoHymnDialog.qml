import bb.cascades 1.4
import bb.system 1.2

Dialog {
    attachedObjects: [
        SystemToast {
            id: toast
            body: "Please enter hymn number."
        }
    ]
    
    function buttonPressed(value) {
        var intValue = parseInt(selectedHymn.text + value, 10)
        
        if (intValue > 0 && intValue <= 1200) {
            selectedHymn.text = selectedHymn.text + value
        }
    }
    
    function backPressed() {
        var initialValue = parseInt(selectedHymn.text, 10)
        if (!isNaN(initialValue)) {
            selectedHymn.text = selectedHymn.text.substring(0,
                selectedHymn.text.length - 1)
        }
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        background: Color.create(0.0, 0.0, 0.0, 0.5)
        
        layout: DockLayout {}
        
        onTouch: {
            console.log("On touch")
        }
        
        Container {
            maxHeight: ui.du(59.7)
            maxWidth: ui.du(59.7)
            leftPadding: ui.du(6)
            rightPadding: leftPadding
            topPadding: ui.du(3)
            bottomPadding: topPadding
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            background: Color.White
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                bottomMargin: 20
                
                TextField {
                    id: selectedHymn
                    hintText: "Hymn number ..."
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 2.1
                    }
                    maximumLength: 4
                }
                
                Button {
                    id: clear
                    imageSource: "asset:///images/ic_action_clear.png"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                    onClicked: {
                        backPressed()
                    }
                }
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                bottomMargin: 20
                
                Button {
                    id: one
                    text: "1"
                    
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                Button {
                    id: two
                    text: "2"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                Button {
                    id: three
                    text: "3"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                bottomMargin: 20
                
                Button {
                    id: four
                    text: "4"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                Button {
                    id: five
                    text: "5"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                Button {
                    id: six
                    text: "6"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                bottomMargin: 20
                
                Button {
                    id: seven
                    text: "7"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                Button {
                    id: eight
                    text: "8"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                Button {
                    id: nine
                    text: "9"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                Button {
                    id: cancel
                    text: "Cancel"
                    onClicked: {
                        close()
                    }
                }
                
                Button {
                    id: zero
                    text: "0"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                Button {
                    id: open
                    text: "Open"
                    onClicked: {
                        
                        var value = parseInt(selectedHymn.text, 10)
                        if (!isNaN(value)) {
//                            open the selected hymn
                        } else {
                            toast.show()
                        }
                    }
                }
            }
        }
    }
}