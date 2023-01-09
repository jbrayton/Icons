//
//  JBColor+UIColor.swift
//  Icons
//
//  Created by John Brayton on 1/8/23.
//

import UIKit

extension JBColor {
    
    var uiColor : UIColor {
        return UIColor(red: self.red, green: self.green, blue: self.blue, alpha: 1.0)
    }
    
}
