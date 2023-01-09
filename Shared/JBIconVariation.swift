//
//  JBIconVariation.swift
//  Icons
//
//  Created by John Brayton on 1/8/23.
//

import Foundation

struct JBIconVariation {
    
    static let primaryIconIdentifier = "red-on-white"

    let identifier: String
    let backgroundColor: JBColor
    let foregroundColor: JBColor

    static let allVariations: [JBIconVariation] = [
        JBIconVariation(identifier: "red-on-white", backgroundColor: JBColor.white, foregroundColor: JBColor.red),
        JBIconVariation(identifier: "green-on-white", backgroundColor: JBColor.white, foregroundColor: JBColor.green),
        JBIconVariation(identifier: "blue-on-white", backgroundColor: JBColor.white, foregroundColor: JBColor.blue),

        JBIconVariation(identifier: "white-on-red", backgroundColor: JBColor.red, foregroundColor: JBColor.white),
        JBIconVariation(identifier: "green-on-red", backgroundColor: JBColor.red, foregroundColor: JBColor.green),
        JBIconVariation(identifier: "blue-on-red", backgroundColor: JBColor.red, foregroundColor: JBColor.blue),

        JBIconVariation(identifier: "red-on-green", backgroundColor: JBColor.green, foregroundColor: JBColor.red),
        JBIconVariation(identifier: "white-on-green", backgroundColor: JBColor.green, foregroundColor: JBColor.white),
        JBIconVariation(identifier: "blue-on-green", backgroundColor: JBColor.green, foregroundColor: JBColor.blue),

        JBIconVariation(identifier: "red-on-blue", backgroundColor: JBColor.blue, foregroundColor: JBColor.red),
        JBIconVariation(identifier: "green-on-blue", backgroundColor: JBColor.blue, foregroundColor: JBColor.green),
        JBIconVariation(identifier: "white-on-blue", backgroundColor: JBColor.blue, foregroundColor: JBColor.white),
    ]

}


