//
//  WidgetViewController.swift
//  Ender
//
//  Created by a on 2022/05/31.
//

import Cocoa

class WidgetViewController: NSViewController {
    @IBOutlet private weak var textField: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.layer?.masksToBounds = true
        self.view.layer?.cornerRadius = 15
        self.view.layer?.isOpaque = false
        self.view.layer?.backgroundColor = NSColor.black.withAlphaComponent(0.8).cgColor

        print("hello")
        self.view.wantsLayer = true
        textField.isEditable = true
        textField.focusRingType = .none
        textField.becomeFirstResponder()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        print(NSEvent.mouseLocation)
        var cursorPoint = NSEvent.mouseLocation
        //cursorPoint.x -= view.frame.size.width / 2
        cursorPoint.y += view.frame.size.height + 50 // / 2

        self.view.window!.windowController?.window?.setFrameTopLeftPoint(cursorPoint)
        view.becomeFirstResponder()
        
    }

    
}
