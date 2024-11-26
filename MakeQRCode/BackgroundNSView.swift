//
//  BackgroundNSView.swift
//
//  Created by Patrick Costello on 5/22/18.
//  Copyright © 2017 Patrick Costello. All rights reserved.
//
#if os(macOS)
import Foundation
import Cocoa

@IBDesignable public class BackgroundNSView: NSView {
    @IBInspectable var backgroundColor: NSColor = NSColor.darkGray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        backgroundColor.setFill()
        dirtyRect.fill()
    }
}
#endif
