//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct ITFBarcodeModelMapper {
    private let converter = ITFElementToCharacterConverter()
    func barcodeModel(from value: ITFCodeValue) -> ITFBarcodeModel {
        let elementCharacters = value.payload
            .elements
            .map(converter.character(for:))
        let elementValue = String(elementCharacters)
        return ITFBarcodeModel(value: elementValue)
    }

    private let parser = ITFPayloadParser()
    func value(from model: ITFBarcodeModel) throws -> ITFCodeValue {
        try ITFCodeValue(payload: parser.payload(for: model.value))
    }
}
