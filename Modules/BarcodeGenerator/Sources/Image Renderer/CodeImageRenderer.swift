//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ImageIO
import SwiftUI
import UniformTypeIdentifiers

import BarcBarcodes
import BarcErrorHandling

public struct CodeImageRenderer {
    private static let codeWidth = 200.0
    private static let backgroundInset = 14.0

    private let errorHandler: any ErrorHandler
    public init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    public func pngData(from value: CodeValue, withBackground: Bool) throws -> Data {
        let renderedCode = CodeValueRenderer(value: value, errorHandler: errorHandler).renderedCode

        let inset = withBackground ? CodeImageRenderer.backgroundInset : 0
        let insetCodeSize = CodeImageRenderer.codeWidth - (inset * 2)

        let scaledCode = renderedCode.scaled(to: CGSize(width: insetCodeSize, height: insetCodeSize), inset: inset)
        guard let context = CGContext(
            data: nil,
            width: Int(Self.codeWidth),
            height: Int(Self.codeWidth),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        )
        else { throw CodeImageRenderError.cannotCreateImageContext }

        if withBackground {
            context.setFillColor(CGColor(gray: 1, alpha: 1))
            context.fill(CGRect(origin: .zero, size: CGSize(width: Self.codeWidth, height: Self.codeWidth)))

            context.addPath(CGPath(roundedRect: CGRect(origin: CGPoint(x: inset, y: inset), size: CGSize(width: insetCodeSize, height: insetCodeSize)), cornerWidth: inset, cornerHeight: inset, transform: nil))
            context.clip()
        }

        context.setFillColor(CGColor(gray: 0, alpha: 1))
        context.fill(scaledCode.rects)

        guard let cgImage = context.makeImage() else {
            throw CodeImageRenderError.cannotGenerateImage
        }

        let data = NSMutableData()
        guard let imageDestination = CGImageDestinationCreateWithData(data, UTType.png.identifier as CFString, 1, nil) else {
            throw CodeImageRenderError.cannotCreateImageDestination
        }

        CGImageDestinationAddImage(imageDestination, cgImage, nil)
        CGImageDestinationFinalize(imageDestination)

        return data as Data
    }
}
