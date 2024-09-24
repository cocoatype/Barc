//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct CodabarBarcodeModelMapper {
    func barcodeModel(from value: CodabarCodeValue) -> CodabarBarcodeModel {
        let converter = CodabarElementToCharacterConverter()
        let elementCharacters = value.payload.elements.map(converter.character(for:))
        let elementValue = String(elementCharacters)
        return CodabarBarcodeModel(value: elementValue)
    }

    func value(from model: CodabarBarcodeModel) throws -> CodabarCodeValue {
        let payload = try CodabarPayloadParser().payload(backtick: model.value)
        return CodabarCodeValue(payload: payload)
    }
}

