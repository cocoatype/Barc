//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreGraphics

struct RenderedCode {
    var rects = [CGRect]()
    var size: CGSize {
        guard let firstRect = rects.first else { return .zero }
        let finalRect = rects.reduce(firstRect) { partialResult, nextRect in
            partialResult.union(nextRect)
        }
        return finalRect.size
    }

    mutating func addRect(_ rect: CGRect) {
        rects.append(rect)
    }

    func scaled(to finalSize: CGSize) -> RenderedCode {
        let currentSize = size
        let scale = CGSize(
            width: finalSize.width / currentSize.width,
            height: finalSize.height / currentSize.height
        )

        let scaledRects = rects.map {
            $0.applying(CGAffineTransform(scaleX: scale.width, y: scale.height))
        }

        return RenderedCode(rects: scaledRects)
    }
}
