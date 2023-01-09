//
//  main.swift
//  IconFileGenerator
//
//  Created by John Brayton on 1/8/23.
//

import Foundation
import Cocoa


// MARK: Generation of icons and .appiconset files

// Each .appiconset directory needs a Contents.json file. This function
// generates that.
func addContentsJson( iconName: String, directory: URL ) {
    var json = [String:Any]()
    var imageDict = [String:String]()
    imageDict["filename"] = String(format: "%@.png", iconName)
    imageDict["idiom"] = "universal"
    imageDict["platform"] = "ios"
    imageDict["size"] = "1024x1024"
    json["images"] = [imageDict]
    var infoDict = [String:Any]()
    infoDict["author"] = "xcode"
    infoDict["version"] = 1
    json["info"] = infoDict

    let data = try! JSONSerialization.data(withJSONObject: json)
    let path = String(format: "%@/%@.appiconset/Contents.json", directory.path(percentEncoded: false), iconName)
    try! data.write(to: URL(fileURLWithPath: path))
}

// Save a .appiconset with the specified image and top-level directory.
func saveAppIconSet( image: NSImage, iconName: String, directory: URL ) {
    let dirPath = String(format: "%@/%@.appiconset", directory.path(percentEncoded: false), iconName)
    try! FileManager.default.createDirectory(at: URL(fileURLWithPath: dirPath), withIntermediateDirectories: false)
    let path = String(format: "%@/%@.png", dirPath, iconName)
    let fileUrl = URL(fileURLWithPath: path)
    try! image.JB_pngData!.write(to: fileUrl)
    addContentsJson( iconName: iconName, directory: directory)
}

// Does the drawing.
func draw( iconVariation: JBIconVariation ) {
    let backgroundColor = iconVariation.backgroundColor.nsColor
    let foregroundColor = iconVariation.foregroundColor.nsColor

    // Generated by PaintCode
    
    let rectanglePath = NSBezierPath(rect: NSRect(x: -2, y: -2, width: 1026, height: 1026))
    backgroundColor.setFill()
    rectanglePath.fill()

    let bezierPath = NSBezierPath()
    bezierPath.move(to: NSPoint(x: 511.5, y: 704))
    bezierPath.line(to: NSPoint(x: 705, y: 319))
    bezierPath.line(to: NSPoint(x: 318, y: 319))
    bezierPath.line(to: NSPoint(x: 511.5, y: 704))
    bezierPath.close()
    bezierPath.windingRule = .evenOdd
    foregroundColor.setFill()
    bezierPath.fill()

}

// MARK: Info.plist file

func plistValues( ipad: Bool ) -> [AnyHashable:Any] {
    var bundleIconsValue = [AnyHashable:Any]()
    bundleIconsValue["CFBundlePrimaryIcon"] = ["CFBundleIconFiles":[JBIconVariation.primaryIconIdentifier],"CFBundleIconName":JBIconVariation.primaryIconIdentifier]
    var alternates = [AnyHashable:Any]()
    for iconVariation in JBIconVariation.allVariations {
        if iconVariation.identifier != JBIconVariation.primaryIconIdentifier {
            let iconName = String(format: "%@", iconVariation.identifier)
            alternates[iconName] = ["CFBundleIconFiles":[iconName], "UIPrerenderedIcon":false,"CFBundleIconName":iconName]
        }
    }
    bundleIconsValue["CFBundleAlternateIcons"] = alternates
    return bundleIconsValue
}

func writePlist(directory: URL) {
    let bundleIcons = ["CFBundleIcons":plistValues(ipad: false), "CFBundleIcons~ipad":plistValues(ipad: true)]
    let plistFileUrl = directory.appending(path: "entries.plist")
    try! (bundleIcons as NSDictionary).write(to: plistFileUrl)
}


// MARK: Top-level file generation

// This does nothing to prevent overwriting an older directory, other than incorporating a UUID into the file path.
let directory = URL(filePath: NSHomeDirectory()).appending(path: "Desktop").appending(path: String(format: "Generated Icons %@", UUID().uuidString))
try! FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)

for iconVariation in JBIconVariation.allVariations {
    let image = NSImage(size: NSSize(width: 1024.0, height: 1024.0))
    image.lockFocus()
    draw(iconVariation: iconVariation)
    image.unlockFocus()
    saveAppIconSet(image: image, iconName: iconVariation.identifier, directory: directory)
}

writePlist(directory: directory)