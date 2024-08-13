//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

enum Constants {
    static var image: CGImage {
        get throws {
            let imageURL = try XCTUnwrap(Bundle.module.url(forResource: "meatybites", withExtension: "heic"))
            let image = try XCTUnwrap(UIImage(contentsOfFile: imageURL.path()))
            return try XCTUnwrap(image.cgImage)
        }
    }
}
