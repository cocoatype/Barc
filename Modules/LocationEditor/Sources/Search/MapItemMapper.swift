//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Contacts
import MapKit

struct MapItemMapper {
    func location(from mapItem: MKMapItem) -> Location {
        guard let postalAddress = mapItem.placemark.postalAddress else {
            return Location(name: name(from: mapItem), coordinate: coordinate(from: mapItem))
        }

        return Location(
            name: name(from: mapItem),
            coordinate: coordinate(from: mapItem),
            thoroughfare: postalAddress.street,
            city: postalAddress.city,
            state: postalAddress.state,
            postalCode: postalAddress.postalCode,
            country: postalAddress.country
        )
    }

    private func name(from mapItem: MKMapItem) -> String {
        mapItem.name ?? "" // figure out a better way to do this
    }

    private func coordinate(from mapItem: MKMapItem) -> Location.Coordinate {
        Location.Coordinate(
            latitude: mapItem.placemark.coordinate.latitude,
            longitude: mapItem.placemark.coordinate.longitude
        )
    }
}
