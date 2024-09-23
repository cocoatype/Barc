//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct Code128BarcodeModelMapper {
    func barcodeModel(from value: Code128CodeValue) -> Code128BarcodeModel {
        fatalError()
    }

    func value(from model: Code128BarcodeModel) throws -> Code128CodeValue {
        fatalError()
    }
}
