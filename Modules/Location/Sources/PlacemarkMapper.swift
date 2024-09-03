//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import CoreLocation

struct PlacemarkMapper {
    func location(from placemark: CLPlacemark) throws -> Location {
        return try Location(name: name(from: placemark), coordinate: coordinate(from: placemark))
    }

    private func name(from placemark: CLPlacemark) -> String {
        placemark.name ?? "" // figure out a better way to do this
    }

    private func coordinate(from placemark: CLPlacemark) throws -> Location.Coordinate {
        guard let location = placemark.location else { throw PlacemarkMapperError.missingCoordinate }
        return Location.Coordinate(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude
        )
    }
}
