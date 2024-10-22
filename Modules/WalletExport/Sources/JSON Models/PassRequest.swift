//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation

struct PassRequest: Encodable {
    let title: String
    let barcode: PassRequestBarcode
    let dates: [PassRequestDate]
    let locations: [PassRequestLocation]

    init(code: Code) throws {
        self.title = code.name
        self.barcode = try PassRequestBarcode(code: code)

        if let date = code.date {
            self.dates = [PassRequestDate(date: date)]
        } else {
            self.dates = []
        }

        if let location = code.location {
            self.locations = [PassRequestLocation(location: location)]
        } else {
            self.locations = []
        }
    }
}
