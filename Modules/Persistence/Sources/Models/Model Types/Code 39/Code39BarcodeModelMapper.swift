//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct Code39BarcodeModelMapper {
    private let converter = Code39ElementToCharacterConverter()
    func barcodeModel(from value: Code39CodeValue) -> Code39BarcodeModel {
        let elementCharacters = value.payload.elements.map(converter.character(for:))
        let elementValue = String(elementCharacters)
        return Code39BarcodeModel(value: elementValue)
    }

    private let parser = Code39PayloadParser()
    func value(from model: Code39BarcodeModel) throws -> Code39CodeValue {
        try Code39CodeValue(payload: parser.payload(for: model.value))
    }
}
