//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreGraphics
import Foundation
import ImageIO
import UIKit

#if os(iOS)
extension CGImage {
    static func image(from data: Data) throws -> CGImage {
        if let dataProvider = CGDataProvider(data: data as CFData),
           let imageSource = CGImageSourceCreateWithDataProvider(dataProvider, nil),
           let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) {
            return cgImage
        } else if let cgImage = try image(fromArchive: data) {
            return cgImage
        } else { throw ShareError.cannotCreateImageFromData }
    }

    private static func image(fromArchive data: Data) throws -> CGImage? {
        let result = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
        return result?.cgImage
    }
}
#endif
