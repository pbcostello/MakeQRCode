//
//  CGRect+ext.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/25/24.
//

import Foundation
import Cocoa

public extension CGRect {
    
    var size: CGSize {
        return CGSize(width: width, height: height)
    }
}
