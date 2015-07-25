import bb.cascades 1.4
import bb.system 1.2

Dialog {
    attachedObjects: [
        SystemToast {
            id: toast
            body: "Please enter hymn number."
        }
    ]
    
    onClosed: {
        selectedHymn.text = ""
    }
    
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
            if (event.propagationPhase == PropagationPhase.AtTarget) {
                
                if (event.touchType == TouchType.Up) {
                    close()
                }
            }
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
                bottomMargin: ui.du(2)
                
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    
                    TextField {
                        id: selectedHymn
                        hintText: "Hymn number ..."
                        layoutProperties: StackLayoutProperties {
                            spaceQuota: 2.1
                        }
                        maximumLength: 4
                        inputMode: TextFieldInputMode.Custom
                        backgroundVisible: false
                    }
                    
                    CustomButton {
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
                    Divider {
                        
                    }
                }
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                bottomMargin: ui.du(2)
                
                CustomButton {
                    id: one
                    text: "1"
                    
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                CustomButton {
                    id: two
                    text: "2"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                CustomButton {
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
                bottomMargin: ui.du(2)
                
                CustomButton {
                    id: four
                    text: "4"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                CustomButton {
                    id: five
                    text: "5"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                CustomButton {
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
                bottomMargin: ui.du(2)
                
                CustomButton {
                    id: seven
                    text: "7"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                CustomButton {
                    id: eight
                    text: "8"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                CustomButton {
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
                bottomMargin: ui.du(2)
                
                CustomButton {
                    highlightable: false
                }
                
                CustomButton {
                    id: zero
                    text: "0"
                    onClicked: {
                        buttonPressed(text)
                    }
                }
                
                CustomButton {
                    highlightable: false
                }
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                CustomButton {
                    highlightable: false
                }
                
                CustomButton {
                    id: cancel
                    text: "Cancel"
                    onClicked: {
                        close()
                    }
                    label.textStyle.color: ui.palette.primary
                }
                
                CustomButton {
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
                    label.textStyle.color: ui.palette.primary
                }
            }
        }
    }
}