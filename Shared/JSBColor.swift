//
//  JSBColor.swift
//  IconFileGenerator
//
//  Created by John Brayton on 1/8/23.
//

import Foundation

struct JSBColor {

    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    
    static let white = JSBColor(red: 1.0, green: 1.0, blue: 1.0)
    static let red = JSBColor(red: 1.0, green: 0.0, blue: 0.0)
    static let green = JSBColor(red: 0.0, green: 1.0, blue: 0.0)
    static let blue = JSBColor(red: 0.0, green: 0.0, blue: 1.0)
    
}

