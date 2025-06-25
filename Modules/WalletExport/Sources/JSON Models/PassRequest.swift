//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import BarcBarcodes

struct PassRequest: Encodable {
    let title: String
    let barcode: PassRequestBarcode
    let dates: [PassRequestDate]
    let locations: [PassRequestLocation]

    init(code: Code) throws {
        self.title = code.name
        self.barcode = try PassRequestBarcode(code: code)

        self.dates = code.dates.map(PassRequestDate.init)
        self.locations = code.locations.map(PassRequestLocation.init)
    }
}
