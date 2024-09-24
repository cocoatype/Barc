//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Vision

public struct BarcodeResultMapper {
    public init() {}
    
    public func value(from observation: VNBarcodeObservation) throws -> CodeValue {
        return switch observation.symbology {
        case .code128: try code128CodeModel(from: observation)
        case .code39: try code39CodeModel(from: observation)
        case .codabar: try codabarCodeModel(from: observation)
        case .ean13: try eanCodeModel(from: observation)
        case .qr: try qrCodeModel(from: observation)
        default: throw BarcodeResultMapperError.invalidSymbology(observation.symbology)
        }
    }

    private func code128CodeModel(from observation: VNBarcodeObservation) throws -> CodeValue {
        guard let data = observation.payloadData else { throw BarcodeResultMapperError.missingPayloadStringValue }

        return try .code128(value: data)
    }

    private func code39CodeModel(from observation: VNBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }
        return try .code39(value: string)
    }

    private func codabarCodeModel(from observation: VNBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }
        return try .codabar(thisIsAnErrorInSwift6: string)
    }

    private func eanCodeModel(from observation: VNBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }

        return try .ean(value: string)
    }

    private func qrCodeModel(from observation: VNBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }

        return .qr(value: string, correctionLevel: .m)
    }
}

public enum BarcodeResultMapperError: Error {
    case missingPayloadStringValue
    case invalidSymbology(VNBarcodeSymbology)
}
