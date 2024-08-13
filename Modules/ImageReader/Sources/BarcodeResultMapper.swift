//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Vision

struct BarcodeResultMapper {
    func barcodeModel(from observation: VNBarcodeObservation) -> BarcodeModel? {
        return switch observation.symbology {
        case .ean13: eanCodeModel(from: observation)
        case .qr: qrCodeModel(from: observation)
        default: nil
        }
    }

    private func qrCodeModel(from observation: VNBarcodeObservation) -> BarcodeModel? {
        guard let string = observation.payloadStringValue else { return nil }

        return .qr(value: string, correctionLevel: "M")
    }

    private func eanCodeModel(from observation: VNBarcodeObservation) -> BarcodeModel? {
        guard let string = observation.payloadStringValue else { return nil }

        return .ean(value: string)
    }
}
