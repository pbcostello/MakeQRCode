//
//  MakeQRView.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/25/24.
//

import Foundation
import AppKit
import Cocoa
import Carbon.HIToolbox

class MakeQRView: BackgroundNSView {
    override var acceptsFirstResponder: Bool {
        return true
    }

    override func keyDown(with event: NSEvent) {
        if event.keyCode == kVK_Escape {
            //quit app when Escape pressed
            NSApp.terminate(nil)
        } else {
            super.keyDown(with: event)
        }
    }
}
