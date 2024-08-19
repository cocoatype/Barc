//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftData

@Model
final class BarcodeModel {
    var name: String
    var type: BarcodeModelType

    init(name: String, type: BarcodeModelType) {
        self.name = name
        self.type = type
    }
}
