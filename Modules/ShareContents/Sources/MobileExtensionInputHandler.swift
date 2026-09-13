//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

#if os(iOS)
import CoreGraphics
import UIKit

import FactoryKit

import BarcBarcodes
import BarcImageReader
import BarcPersistence

@MainActor struct MobileExtensionInputHandler {
    private let imageReader = ImageReader()

    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository

    func handleInput(from extensionContext: NSExtensionContext?) async throws -> CodeValue {
        guard let extensionContext else {
            throw ShareError.noExtensionContext
        }

        let inputProviders = extensionContext.extensionItems.compactMap(\.attachments).flatMap({ $0 })
        guard inputProviders.count > 0 else {
            throw ShareError.noInputProviders
        }

        guard let imageProvider = inputProviders.first(where: { inputProvider in
            inputProvider.contains(.image) || inputProvider.contains(.url)
        }) else {
            throw ShareError.noImageProviders
        }

        let cgImage = try await loadImage(from: imageProvider)
        guard let codeValue = try await imageReader.codeValue(in: cgImage) else { throw ShareError.noCodeInImage }
        return codeValue
    }

    private func loadImage(from imageProvider: NSItemProvider) async throws -> CGImage {
        let data: Data
        if imageProvider.contains(.image) {
            data = try await imageProvider.loadData(for: .image)
        } else if imageProvider.contains(.url) {
            let url: NSURL = try await imageProvider.loadItem(for: .url)
            (data, _) = try await URLSession.shared.data(from: url as URL)
        } else {
            throw ShareError.unexpectedContentType
        }

        return try CGImage.image(from: data)
    }
}
#endif
