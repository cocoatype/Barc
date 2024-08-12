//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import CoreImage.CIFilterBuiltins
import SwiftUI

enum QRGenerator {
    static func generateQRImage(payload errorCorrectedPayload: QRPayload, errorCorrectionLevel: QRCorrectionLevel, size: CGSize) throws -> Image {
        let data = errorCorrectedPayload.data

        let filter = CIFilter.qrCodeGenerator()
        filter.message = data
        filter.correctionLevel = value(for: errorCorrectionLevel)

        guard let output = filter.outputImage else {
            throw QRGenerationError.cannotReturnOutput
        }

        let size = min(size.width, size.height)
        let scale = floor(size / output.extent.width)
        let transformed = output.transformed(by: CGAffineTransform(scaleX: scale, y: scale))

        let context = CIContext()

        guard let cgImage = context.createCGImage(transformed, from: transformed.extent) else {
            throw QRGenerationError.cannotCreateCGImage
        }

        return Image(cgImage, scale: 1, label: Text("QR Code"))
    }

    private static func value(for correctionLevel: QRCorrectionLevel) -> String {
        return switch correctionLevel {
        case .l: "L"
        case .m: "M"
        case .q: "Q"
        case .h: "H"
        }
    }
}