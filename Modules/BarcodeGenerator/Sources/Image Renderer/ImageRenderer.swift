//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ImageIO
import SwiftUI
import UniformTypeIdentifiers

@MainActor public struct CodeImageRenderer {
    public init() {}

    public func pngData(from value: CodeValue, withBackground: Bool) throws -> Data {
        let view = renderedCode(from: value, withBackground: withBackground, size: CGSize(width: 200, height: 200))
        let imageRenderer = ImageRenderer(content: view)
        guard let image = imageRenderer.cgImage else { throw CodeImageRenderError.cannotGenerateImage }

        let data = NSMutableData()
        guard let imageDestination = CGImageDestinationCreateWithData(data, UTType.png.identifier as CFString, 1, nil) else {
            throw CodeImageRenderError.cannotCreateImageDestination
        }

        CGImageDestinationAddImage(imageDestination, image, nil)
        CGImageDestinationFinalize(imageDestination)

        return data as Data
    }

    @ViewBuilder
    private func renderedCode(
        from value: CodeValue,
        withBackground: Bool,
        size: CGSize
    ) -> some View {
        CodeRenderer(value: value)
            .padding(withBackground ? CodeBackground.padding : 0)
            .background {
                if withBackground {
                    CodeBackground()
                }
            }
            .frame(width: size.width, height: size.height)
    }
}

enum CodeImageRenderError: Error {
    case cannotCreateImageDestination
    case cannotGenerateImage
}
