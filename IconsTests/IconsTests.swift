//
//  IconsTests.swift
//  IconsTests
//
//  Created by John Brayton on 1/8/23.
//

import XCTest
@testable import Icons

final class IconsTests: XCTestCase {

    func testIcons() {

        let infoDictionary = Bundle.main.infoDictionary!
        let deviceIconSpec = infoDictionary["CFBundleIcons"] as! [String:Any]
        let alternates = deviceIconSpec["CFBundleAlternateIcons"] as! [String:Any]

        var seenIdentifiers = Set<String>()
        for iconVariation in JSBIconVariation.allVariations {
            
            // Make sure the icon has a unique name.
            XCTAssert(!seenIdentifiers.contains(iconVariation.identifier))
            seenIdentifiers.insert(iconVariation.identifier)

            // Verify that the icon is in the Info.plist file as expected. Note that this check really should
            // be run on both an iPhone simulator and an iPad simulator. On iPad, deviceIconSpec["CFBundleAlternateIcons"]
            // returns "CFBundleIcons~ipad" from the Info.plist file.
            if iconVariation.identifier != JSBIconVariation.primaryIconIdentifier {
                let entry = alternates[iconVariation.identifier] as! [String:Any]
                XCTAssertEqual(entry["CFBundleIconName"] as? String, iconVariation.identifier)
            }
            
            let image = UIImage(named: iconVariation.identifier)!
            XCTAssertEqual(image.size.width, 1024)
            XCTAssertEqual(image.size.height, 1024)
        }
    }
    
}
