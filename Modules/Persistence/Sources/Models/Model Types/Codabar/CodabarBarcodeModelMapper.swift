//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct CodabarBarcodeModelMapper {
    private let converter = CodabarElementToCharacterConverter()
    func barcodeModel(from value: CodabarCodeValue) -> CodabarBarcodeModel {
        let elementCharacters = value.payload.elements.map(converter.character(for:))
        let elementValue = String(elementCharacters)
        return CodabarBarcodeModel(value: elementValue)
    }

    let parser = CodabarPayloadParser()
    func value(from model: CodabarBarcodeModel) throws -> CodabarCodeValue {
        try CodabarCodeValue(payload: parser.payload(backtick: model.value))
    }
}
