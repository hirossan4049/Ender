//
//  TransparentWindow.swift
//  Ender
//
//  Created by a on 2022/05/31.
//

import Cocoa

class TransparentWindow: NSWindow {

    // 透明ウィンドウをよしなに作ってくれる
    init(contentViewController: NSViewController){
        // frameとstyleを設定してwindow生成
        let contentRect = contentViewController.view.frame
        let styleMask: NSWindow.StyleMask = [.resizable, .titled]
        let backingType: NSWindow.BackingStoreType = .buffered
        super.init(contentRect: contentRect, styleMask: styleMask, backing: backingType, defer: false)

        self.contentViewController = contentViewController // VCを設定
        self.tabbingMode = .disallowed // タブでなく毎回新規ウィンドウで開く
        self.hasShadow = false // ウィンドウに影をつけない
        self.isOpaque = false // ウィンドウを透明にする

        // 背景色を設定
        let backgroundColor: NSColor = .init(white: 0, alpha: 0)
        self.backgroundColor = backgroundColor
        
        self.styleMask.remove(.titled) // styleMaskを外す
        self.titlebarAppearsTransparent = true // タイトルバーを透明に
        self.titleVisibility = .hidden // タイトルを表示しない
        self.isMovableByWindowBackground = true
        let windowLevelKey: CGWindowLevelKey = .popUpMenuWindow
        self.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(windowLevelKey)))
        setFrameTopLeftPoint(NSEvent.mouseLocation)
    }
    
    override var canBecomeKey: Bool { true }
}
