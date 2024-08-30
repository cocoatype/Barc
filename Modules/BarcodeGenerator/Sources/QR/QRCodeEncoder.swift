//  Created by Geoff Pado on 8/29/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import QRCodeGenerator

struct QRCodeEncoder {
    func encodedValue(for value: QRCodeValue) throws -> QRCode {
        if let string = String(data: value.payload.data, encoding: .utf8) {
            return try QRCode.encode(text: string, ecl: ecc(for: value))
        } else {
            let bytes = value.payload.data.map { $0 }
            return try QRCode.encode(binary: bytes, ecl: ecc(for: value))
        }
    }

    private func ecc(for value: QRCodeValue) -> QRCodeECC {
        switch value.correctionLevel {
        case .l:
            return .low
        case .m:
            return .medium
        case .q:
            return .quartile
        case .h:
            return .high
        }
    }
}
