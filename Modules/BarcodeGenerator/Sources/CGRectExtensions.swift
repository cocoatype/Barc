//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreGraphics

import BarcBarcodes

extension CGRect {
    func fitting(rect fittingRect: CGRect) -> CGRect {
        let aspectRatio = width / height
        let fittingAspectRatio = fittingRect.width / fittingRect.height

        if fittingAspectRatio > aspectRatio { // wider fitting rect
            let newRectWidth = aspectRatio * fittingRect.height
            let newRectHeight = fittingRect.height
            let newRectX = (fittingRect.width - newRectWidth) / 2
            let newRectY = CGFloat(0)

            return CGRect(x: newRectX, y: newRectY, width: newRectWidth, height: newRectHeight)
        } else if fittingAspectRatio < aspectRatio { // taller fitting rect
            let newRectWidth = fittingRect.width
            let newRectHeight = 1 / (aspectRatio / fittingRect.width)
            let newRectX = CGFloat(0)
            let newRectY = (fittingRect.height - newRectHeight) / 2

            return CGRect(x: newRectX, y: newRectY, width: newRectWidth, height: newRectHeight)
        } else { // same aspect ratio
            return fittingRect
        }
    }

    func filling(rect otherRect: CGRect) -> CGRect {
        let aspectRatio = width / height
        let otherAspectRatio = otherRect.width / otherRect.height

        if otherAspectRatio > aspectRatio { // wider other rect
            let newRectWidth = otherRect.width
            let newRectHeight = 1 / (aspectRatio / otherRect.width)
            let newRectX = CGFloat(0)
            let newRectY = (otherRect.height - newRectHeight) / 2

            return CGRect(x: newRectX, y: newRectY, width: newRectWidth, height: newRectHeight)
        } else if otherAspectRatio < aspectRatio { // taller other rect
            let newRectWidth = aspectRatio * otherRect.height
            let newRectHeight = otherRect.height
            let newRectX = (otherRect.width - newRectWidth) / 2
            let newRectY = CGFloat(0)

            return CGRect(x: newRectX, y: newRectY, width: newRectWidth, height: newRectHeight)
        } else { // same aspect ratio
            return otherRect
        }
    }
}
