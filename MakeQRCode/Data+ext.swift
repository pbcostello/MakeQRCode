//
//  Data+ext.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/25/24.
//
import Foundation
import Cocoa

public extension Data {
    
    func qrImage() -> CIImage? {
        // Create QR Code filter
        guard let qrFilter: CIFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        // Create QR Code CIImage
        qrFilter.setValue(self, forKey: "inputMessage")
        return qrFilter.outputImage
    }
}
