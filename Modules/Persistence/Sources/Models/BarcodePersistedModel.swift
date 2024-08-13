//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftData

@Model
final class BarcodePersistedModel {
    var type: BarcodeModelType

    init(type: BarcodeModelType) {
        self.type = type
    }

    convenience init(barcodeModel: BarcodeModel) {
        self.init(type: barcodeModel.type)
    }

    var barcodeModel: BarcodeModel {
        BarcodeModel(type: type, id: .swiftData(persistentModelID))
    }
}
