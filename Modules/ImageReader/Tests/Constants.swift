//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing
import UIKit

enum Constants {
    static var image: CGImage {
        get throws {
            let imageURL = try #require(Bundle.module.url(forResource: "meatybites", withExtension: "heic"))
            let image = try #require(UIImage(contentsOfFile: imageURL.path()))
            return try #require(image.cgImage)
        }
    }
}
