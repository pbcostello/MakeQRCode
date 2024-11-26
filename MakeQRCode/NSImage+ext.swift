//
//  NSImage+ext.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/25/24.
//
import Foundation
import Cocoa

public extension NSImage {

    
    func saveImageAsPNG(url: URL) -> Bool {
        /*
         Needs write entitlement
         <key>com.apple.security.files.user-selected.read-write</key>
         <true/>*/
        let bitmapImage: NSBitmapImageRep? = bitmapImageRep()
        if let pngData: Data = bitmapImage?.pngData() {
            do {
                try pngData.write(to: url)
                print("Image successfully saved to \(url.path)")
                return true
            } catch {
                print("Failed to save image: \(error)")
                return false
            }
        }
        return false
    }

    func bitmapImageRep() -> NSBitmapImageRep? {
        guard let tiffData: Data = self.tiffRepresentation,
              let bitmapImage: NSBitmapImageRep = NSBitmapImageRep(data: tiffData) else {
            print("Failed to create bitmap representation of the image.")
            return nil
        }
        return bitmapImage
    }
}
