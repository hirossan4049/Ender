//
//  AppDelegate.swift
//  Ender
//
//  Created by a on 2022/05/31.
//

import Cocoa
import Magnet

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var widgetWindowController: NSWindowController = {
        let widgetStoryboard = NSStoryboard(name: "Widget", bundle: nil)
        guard let widgetViewController = widgetStoryboard.instantiateInitialController() as? WidgetViewController else{
            fatalError("Couldn't instantiate view controller!")
        }
        //        vc.view.layer?.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        // VCをwindowに載せて表示
        return NSWindowController(window: TransparentWindow(contentViewController: widgetViewController))
    }()
    
    private var isShow = false
    
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        //         Insert code here to initialize your application
        
        if let keyCombo = KeyCombo(key: .w, cocoaModifiers: [.control]) {
            let hotKey = HotKey(identifier: "CommandControlB", keyCombo: keyCombo, target: self, action: #selector(show))
            hotKey.register() // or HotKeyCenter.shared.register(with: hotKey)
        }
    }
    
    @objc func show() {
        if isShow {
            widgetWindowController.close()
            isShow.toggle()
        } else {
            widgetWindowController.showWindow(self)
            isShow.toggle()
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    
}

