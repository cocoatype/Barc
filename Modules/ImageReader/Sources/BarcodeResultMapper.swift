//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Vision

public struct BarcodeResultMapper {
    public init() {}
    
    public func value(from observation: VNBarcodeObservation) throws -> CodeValue {
        return switch observation.symbology {
        case .ean13: try eanCodeModel(from: observation)
        case .qr: try qrCodeModel(from: observation)
        default: throw BarcodeResultMapperError.invalidSymbology(observation.symbology)
        }
    }

    private func qrCodeModel(from observation: VNBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }

        return .qr(value: string, correctionLevel: .m)
    }

    private func eanCodeModel(from observation: VNBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }

        return try .ean(value: string)
    }
}

enum BarcodeResultMapperError: Error {
    case missingPayloadStringValue
    case invalidSymbology(VNBarcodeSymbology)
}
