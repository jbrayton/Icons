//
//  JSBColor+NSColor.swift
//  IconFileGenerator
//
//  Created by John Brayton on 1/8/23.
//

import Cocoa

extension JSBColor {
    
    var nsColor : NSColor {
        return NSColor(red: self.red, green: self.green, blue: self.blue, alpha: 1.0)
    }
    
}
