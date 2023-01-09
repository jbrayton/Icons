//
//  JSBIconVariation.swift
//  Icons
//
//  Created by John Brayton on 1/8/23.
//

import Foundation

struct JSBIconVariation {
    
    static let primaryIconIdentifier = "red-on-white"

    let identifier: String
    let backgroundColor: JSBColor
    let foregroundColor: JSBColor

    static let allVariations: [JSBIconVariation] = [
        JSBIconVariation(identifier: "red-on-white", backgroundColor: JSBColor.white, foregroundColor: JSBColor.red),
        JSBIconVariation(identifier: "green-on-white", backgroundColor: JSBColor.white, foregroundColor: JSBColor.green),
        JSBIconVariation(identifier: "blue-on-white", backgroundColor: JSBColor.white, foregroundColor: JSBColor.blue),

        JSBIconVariation(identifier: "white-on-red", backgroundColor: JSBColor.red, foregroundColor: JSBColor.white),
        JSBIconVariation(identifier: "green-on-red", backgroundColor: JSBColor.red, foregroundColor: JSBColor.green),
        JSBIconVariation(identifier: "blue-on-red", backgroundColor: JSBColor.red, foregroundColor: JSBColor.blue),

        JSBIconVariation(identifier: "red-on-green", backgroundColor: JSBColor.green, foregroundColor: JSBColor.red),
        JSBIconVariation(identifier: "white-on-green", backgroundColor: JSBColor.green, foregroundColor: JSBColor.white),
        JSBIconVariation(identifier: "blue-on-green", backgroundColor: JSBColor.green, foregroundColor: JSBColor.blue),

        JSBIconVariation(identifier: "red-on-blue", backgroundColor: JSBColor.blue, foregroundColor: JSBColor.red),
        JSBIconVariation(identifier: "green-on-blue", backgroundColor: JSBColor.blue, foregroundColor: JSBColor.green),
        JSBIconVariation(identifier: "white-on-blue", backgroundColor: JSBColor.blue, foregroundColor: JSBColor.white),
    ]

}


