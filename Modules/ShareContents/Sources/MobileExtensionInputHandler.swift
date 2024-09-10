//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

#if os(iOS)
import Barcodes
import CoreGraphics
import ImageReader
import Persistence
import Purchasing
import UIKit

struct MobileExtensionInputHandler {
    private let imageReader = ImageReader()

    private let barcodeRepository: any BarcodeRepository
    private let purchaseRepository: any PurchaseRepository
    init(
        barcodeRepository: any BarcodeRepository = Persistence.defaultRepository,
        purchaseRepository: any PurchaseRepository = Purchasing.defaultRepository
    ) {
        self.barcodeRepository = barcodeRepository
        self.purchaseRepository = purchaseRepository
    }

    func handleInput(from extensionContext: NSExtensionContext?) async throws -> CodeValue {
        guard try await purchaseRepository.hasUserBeenUnleashed,
              try await barcodeRepository.codes.count < Purchasing.maxBarcodesCount
        else { throw ShareError.userIsNotUnleashed }
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
        let cgImage = try CGImage.image(from: data)
        guard let codeValue = try await imageReader.codeValue(in: cgImage) else { throw ShareError.noCodeInImage }
        return codeValue
    }
}
#endif
