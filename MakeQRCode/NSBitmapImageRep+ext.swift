//
//  NSBitmapImageRep+ext.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/25/24.
//
import Foundation
import Cocoa


public extension NSBitmapImageRep {
    func pngData () -> Data? {
        return self.representation(using: .png, properties: [:])
    }
}
