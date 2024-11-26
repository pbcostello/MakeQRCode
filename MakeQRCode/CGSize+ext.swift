//
//  CGSize+ext.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/25/24.
//

import Foundation
import Cocoa

public extension CGSize {
    
    var center: CGPoint {
        return CGPoint(x: width / 2, y: height / 2)
    }
    
    static func - (left: CGSize, right: CGSize) -> CGSize {
        return CGSize(width: left.width - right.width, height: left.height - right.height)
    }
    
    static func / (left: CGSize, d: CGFloat) -> CGSize {
        return CGSize(width: left.width / d, height: left.height / d)
    }
    
    var half: CGSize {
        return self / 2.0
    }
}
