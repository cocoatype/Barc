//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreImage
import Vision

import BarcBarcodes

public struct BarcodeResultMapper: Sendable {
    public init() {}

    public func value(from observation: ImageReaderBarcodeObservation) throws -> CodeValue {
        return switch observation.symbology {
        case .code128: try code128CodeModel(from: observation)
        case .code39: try code39CodeModel(from: observation)
        case .codabar: try codabarCodeModel(from: observation)
        case .ean13: try eanCodeModel(from: observation)
        case .pdf417: try pdf417CodeModel(from: observation)
        case .qr: try qrCodeModel(from: observation)
        default: throw BarcodeResultMapperError.invalidSymbology(observation.symbology)
        }
    }

    private func code128CodeModel(from observation: ImageReaderBarcodeObservation) throws -> CodeValue {
        guard let data = observation.payloadData else { throw BarcodeResultMapperError.missingPayloadStringValue }

        return try .code128(value: data)
    }

    private func code39CodeModel(from observation: ImageReaderBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }
        return try .code39(value: string)
    }

    private func codabarCodeModel(from observation: ImageReaderBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }
        return try .codabar(thisIsAnErrorInSwift6: string)
    }

    private func eanCodeModel(from observation: ImageReaderBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }

        return try .ean(value: string)
    }

    private func pdf417CodeModel(from observation: ImageReaderBarcodeObservation) throws -> CodeValue {
        guard let payloadData = (observation.barcodeDescriptor as? CIPDF417CodeDescriptor)?.errorCorrectedPayload else { throw BarcodeResultMapperError.missingPayloadStringValue }
        let integers = payloadData.withUnsafeBytes { Array($0.bindMemory(to: UInt16.self)) }
        guard let size = integers.first else { throw BarcodeResultMapperError.missingLengthValue }

        var actualData = integers.prefix(Int(size)).removingSuffix { $0 == 900 }
        actualData[0] = UInt16(actualData.count)
        return try .pdf417(value: actualData)
    }

    private func qrCodeModel(from observation: ImageReaderBarcodeObservation) throws -> CodeValue {
        guard let string = observation.payloadStringValue else { throw BarcodeResultMapperError.missingPayloadStringValue }

        return .qr(value: string, correctionLevel: .m)
    }
}

extension Collection where Index == Int {
    func removingSuffix(while predicate: (Element) -> Bool) -> [Element] {
        var index = endIndex - 1
        while index >= 0 && predicate(self[index]) {
            index -= 1
        }
        return Array(self[...Swift.max(index, -1)])
    }
}
