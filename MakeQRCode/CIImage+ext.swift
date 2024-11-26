//
//  CIImage+ext.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/24/24.
//

import Foundation
#if os(macOS)
import AppKit
#endif

import Cocoa

public extension CIImage {
    
    func scaled(scaleX: CGFloat, y: CGFloat) -> CIImage {
        return self.transformed(by: CGAffineTransform(scaleX: scaleX, y: y))
    }
    
    var cgImage: CGImage? {
        return CIContext().createCGImage(self, from: self.extent)
    }
#if os(macOS)
    var NSSize: NSSize {
        return .init(width: self.cgImage?.width ?? 0, height: self.cgImage?.height ?? 0)
    }

    var NSImage: NSImage? {
        return AppKit.NSImage(cgImage: self.cgImage!, size: self.NSSize)
    }
#endif
}
