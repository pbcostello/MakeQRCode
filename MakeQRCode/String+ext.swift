//
//  String+ext.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/25/24.
//
import Foundation
import Cocoa

public extension String {
    
    var data: Data? {
        return self.data(using: .utf8)
    }
    
    func qrCIImage(_ scale: CGFloat) -> CIImage? {
        let ciImage: CIImage? = self.data?.qrImage()
        return ciImage?.scaled(scaleX: scale, y: scale)
    }
}
