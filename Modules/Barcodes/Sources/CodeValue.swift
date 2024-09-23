//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public enum CodeValue: Hashable, Identifiable, Sendable {
    case qr(QRCodeValue)
    case ean(EANCodeValue)
    case code128(Code128CodeValue)

    public static func qr(value: String, correctionLevel: QRCodeValue.CorrectionLevel) -> CodeValue {
        return .qr(QRCodeValue(string: value, correctionLevel: correctionLevel))
    }

    public static func ean(value: String) throws -> CodeValue {
        let parser = EANPayloadParser()
        return try .ean(EANCodeValue(payload: parser.payload(for: value)))
    }

    public static func code128(value: Data) throws -> CodeValue {
        return try .code128(Code128CodeValue(payload: Code128PayloadParser().payload(for: value)))
    }

    public var id: String {
        switch self {
        case .qr(let value): String(describing: value.id)
        case .ean(let value): String(describing: value.id)
        case .code128(let value): String(describing: value.id)
        }
    }

    // kineNoo by @eaglenaut on 2023-12-04
    // the aspect ratio of the represented barcode
    public var kineNoo: Double {
        switch self {
        case .ean, .code128: 1 / 2
        case .qr: 1 / 1
        }
    }
}
