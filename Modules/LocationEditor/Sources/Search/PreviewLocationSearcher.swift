//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct PreviewLocationSearcher: LocationSearcher {
    static let allLocations: [Location] = [
        Location(
            name: "1 Infinite Loop",
            coordinate: Location.Coordinate(),
            thoroughfare: "1 Infinite Loop",
            city: "Cupertino",
            state: "CA",
            postalCode: "95014",
            country: "United States"
        ),
        Location(name: "Apple Park", coordinate: Location.Coordinate()),
        Location(name: "Steve Jobs Theater", coordinate: Location.Coordinate()),
        Location(name: "Moscone Center", coordinate: Location.Coordinate()),
    ]

    func locations(for string: String) -> [Location] {
        Self.allLocations
    }
}
