//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import CoreGraphics
import ImageReader
import Foundation

struct ExtensionInputHandler {
    private let imageReader = ImageReader()

    func handleInput(from extensionContext: NSExtensionContext?) async throws -> CodeValue {
        guard let extensionContext else {
            throw ShareError.noExtensionContext
        }

        let inputProviders = extensionContext.extensionItems.compactMap(\.attachments).flatMap({ $0 })
        guard inputProviders.count > 0 else {
            throw ShareError.noInputProviders
        }

        let imageProviders = inputProviders.filter { inputProvider in
            inputProvider.registeredContentTypes.contains { type in
                type.conforms(to: .image)
            }
        }
        guard let imageProvider = imageProviders.first else {
            throw ShareError.noImageProviders
        }

        let data = try await imageProvider.loadData(for: .image)
        guard let cgImage = CGImage.image(from: data) else { throw ShareError.cannotCreateImageFromData }
        guard let codeValue = try await imageReader.codeValue(in: cgImage) else { throw ShareError.noCodeInImage }
        return codeValue
    }
}
