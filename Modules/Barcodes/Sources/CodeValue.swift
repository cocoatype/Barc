//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public enum CodeValue: Hashable, Identifiable, Sendable {
    case qr(QRCodeValue)
    case ean(EANCodeValue)

    public static func qr(value: String, correctionLevel: QRCodeValue.CorrectionLevel) -> CodeValue {
        return .qr(QRCodeValue(string: value, correctionLevel: correctionLevel))
    }

    public static func ean(value: String) throws -> CodeValue {
        let parser = EANPayloadParser()
        return try .ean(EANCodeValue(payload: parser.payload(for: value)))
    }

    public var id: String {
        switch self {
        case .qr(let value): String(describing: value.id)
        case .ean(let value): String(describing: value.id)
        }
    }
}
