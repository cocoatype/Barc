//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation

struct Code128BarcodeModelMapper {
    func barcodeModel(from value: Code128CodeValue) -> Code128BarcodeModel {
        let converter = Code128ElementToByteConverter()
        let elementBytes = value.payload.elements.map(converter.byte(for:))
        let elementData = Data(elementBytes)
        return Code128BarcodeModel(value: elementData)
    }

    func value(from model: Code128BarcodeModel) throws -> Code128CodeValue {
        let payload = try Code128PayloadParser().payload(for: model.value)
        return Code128CodeValue(payload: payload)
    }
}
