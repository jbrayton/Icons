//
//  NSImage+pngData.swift
//  IconFileGenerator
//
//  Created by John Brayton on 1/8/23.
//

import Cocoa

extension NSImage {
    
    var JSB_pngData: Data? {
        if let tiff = self.tiffRepresentation, let tiffData = NSBitmapImageRep(data: tiff) {
            return tiffData.representation(using: .png, properties: [:])
        }
        return nil
    }

}
