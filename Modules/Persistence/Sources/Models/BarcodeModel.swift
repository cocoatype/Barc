//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation
import SwiftData

@Model
final class BarcodeModel {
    var name: String?
    var type: BarcodeModelType?
    var location: BarcodeLocation?
    var date: Date? // trigger date
    var createdDate = Date()

    init(
        name: String,
        type: BarcodeModelType,
        location: BarcodeLocation?,
        date: Date?,
        createdDate: Date
    ) {
        self.name = name
        self.type = type
        self.location = location
        self.date = date
        self.createdDate = createdDate
    }
}
