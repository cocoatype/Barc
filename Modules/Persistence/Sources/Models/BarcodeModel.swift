//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Foundation
import SwiftData

import BarcBarcodes

@Model
final class BarcodeModel {
    var name: String?
    var type: BarcodeModelType?
    private var triggerLocations = [BarcodeLocation]()
    private var triggerDates = [Date]()
    var createdDate = Date()

    @Transient var allLocations: [BarcodeLocation] {
        get {
            guard let location = location else {
                return triggerLocations
            }
            return [location] + triggerLocations
        }
        set(newLocations) { triggerLocations = newLocations }
    }

    @Transient var allDates: [Date] {
        get {
            guard let date = date else {
                return triggerDates
            }
            return [date] + triggerDates
        }
        set(newDates) { triggerDates = newDates }
    }

    init(
        name: String,
        type: BarcodeModelType,
        locations: [BarcodeLocation],
        dates: [Date],
        createdDate: Date
    ) {
        self.name = name
        self.type = type
        self.triggerLocations = locations
        self.triggerDates = dates
        self.createdDate = createdDate
    }

    // deprecated attributes
    private var location: BarcodeLocation?
    private var date: Date?
}
