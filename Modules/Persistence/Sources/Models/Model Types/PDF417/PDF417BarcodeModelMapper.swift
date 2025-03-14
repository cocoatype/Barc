//  Created by Geoff Pado on 12/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes
import PDF417

struct PDF417BarcodeModelMapper {
    private let codewordConverter = CodewordToIntConverter()
    func barcodeModel(from value: PDF417CodeValue) -> PDF417BarcodeModel {
        let integers = value.dataCodewords
            .map(codewordConverter.value(for:))
            .map(UInt16.init)
        return PDF417BarcodeModel(value: integers)
    }

    private let intConverter = IntToCodewordConverter()
    func value(from model: PDF417BarcodeModel) throws -> PDF417CodeValue {
        let codewords = try model.value
            .map(Int.init)
            .map(intConverter.codeword(for:))
        return PDF417CodeValue(dataCodewords: codewords)
    }
}
