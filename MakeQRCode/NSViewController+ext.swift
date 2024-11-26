//
//  NSViewController+ext.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/25/24.
//

import Foundation
import Cocoa

public extension NSViewController {
    
    func centerWindowOnScreen() {
        guard let window = view.window else { return }
        
        if let screenFrame = NSScreen.main?.frame {
            let diff: CGSize = (screenFrame.size - window.frame.size).half

            window.setFrameOrigin(NSPoint(x: screenFrame.origin.x + diff.width, y: screenFrame.origin.y + diff.height))
        }
    }
}
