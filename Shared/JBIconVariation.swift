//
//  JBIconVariation.swift
//  Icons
//
//  Created by John Brayton on 1/8/23.
//

import Foundation

struct JBIconVariation {
    
    static let primaryIconIdentifier = "red"

    let identifier: String
    let backgroundColor: JBColor
    let foregroundColor: JBColor

    static let allVariations: [JBIconVariation] = [
        JBIconVariation(identifier: "red", backgroundColor: JBColor.white, foregroundColor: JBColor.red),
        JBIconVariation(identifier: "green", backgroundColor: JBColor.white, foregroundColor: JBColor.green),
        JBIconVariation(identifier: "blue", backgroundColor: JBColor.white, foregroundColor: JBColor.blue)
    ]

}


