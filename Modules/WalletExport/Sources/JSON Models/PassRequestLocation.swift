//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes
import Foundation

struct PassRequestLocation: Encodable {
    private let latitude: Double
    private let longitude: Double
    private let name: String

    init(location: Location) {
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        self.name = location.name
    }
}
