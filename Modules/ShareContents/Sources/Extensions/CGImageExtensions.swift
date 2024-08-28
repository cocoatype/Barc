//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreGraphics
import Foundation
import ImageIO

extension CGImage {
    static func image(from data: Data) -> CGImage? {
        guard let dataProvider = CGDataProvider(data: data as CFData),
              let imageSource = CGImageSourceCreateWithDataProvider(dataProvider, nil)
        else { return nil }

        return CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
    }
}
