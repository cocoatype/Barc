//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct EANBarcodeModelMapper {
    func barcodeModel(from value: EANCodeValue) -> EANBarcodeModel {
        let string = value.payload.digits.map { digit in
            switch digit {
            case .d0: "0"
            case .d1: "1"
            case .d2: "2"
            case .d3: "3"
            case .d4: "4"
            case .d5: "5"
            case .d6: "6"
            case .d7: "7"
            case .d8: "8"
            case .d9: "9"
            }
        }.joined()
        return EANBarcodeModel(value: string)
    }

    func value(from model: EANBarcodeModel) throws -> EANCodeValue {
        let payload = try payloadParser.payload(for: model.value)
        return EANCodeValue(payload: payload)
    }

    private let payloadParser = EANPayloadParser()
}
