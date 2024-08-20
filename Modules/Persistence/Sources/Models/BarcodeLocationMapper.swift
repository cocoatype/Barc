//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct BarcodeLocationMapper {
    func barcodeLocation(from location: Location) -> BarcodeLocation {
        return BarcodeLocation(
            name: location.name,
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            street: location.thoroughfare,
            city: location.city,
            state: location.state,
            postalCode: location.postalCode,
            country: location.country
        )
    }

    func location(from barcodeLocation: BarcodeLocation) -> Location {
        return Location(
            name: barcodeLocation.name,
            coordinate: .init(latitude: barcodeLocation.latitude, longitude: barcodeLocation.longitude),
            thoroughfare: barcodeLocation.street,
            city: barcodeLocation.city,
            state: barcodeLocation.state,
            postalCode: barcodeLocation.postalCode,
            country: barcodeLocation.country
        )
    }
}
