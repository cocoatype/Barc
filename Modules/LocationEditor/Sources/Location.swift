//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Location: Hashable, Identifiable, Sendable {
    public var id: String {
        "\(name) <\(coordinates.formattedComponents)>"
    }

    let name: String
    let coordinates: Coordinate
    // thoroughfare by @nutterfi on 2024-08-19
    // because "street" was too boring for him
    let thoroughfare: String
    let city: String
    let state: String
    let postalCode: String
    let country: String

    init(
        name: String,
        coordinates: Coordinate,
        thoroughfare: String = "",
        city: String = "",
        state: String = "",
        postalCode: String = "",
        country: String = ""
    ) {
        self.name = name
        self.coordinates = coordinates
        self.thoroughfare = thoroughfare
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }

    struct Coordinate: Hashable {
        let latitude: Double
        let longitude: Double

        init(latitude: Double = .zero, longitude: Double = .zero) {
            self.latitude = latitude
            self.longitude = longitude
        }

        var formattedComponents: String {
            func format(_ element: Double) -> String {
                element.formatted(.number.precision(.fractionLength(0..<3)))
            }

            return "\(format(latitude)), \(format(longitude))"
        }
    }
}
