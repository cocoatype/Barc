//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Location: Hashable, Identifiable, Sendable {
    public var id: String {
        "\(name) <\(coordinates.formattedComponents)>"
    }

    public let name: String
    public let coordinates: Coordinate
    // thoroughfare by @nutterfi on 2024-08-19
    // because "street" was too boring for him
    public let thoroughfare: String
    public let city: String
    public let state: String
    public let postalCode: String
    public let country: String

    public init(
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

    public struct Coordinate: Hashable, Sendable {
        let latitude: Double
        let longitude: Double

        public init(latitude: Double = .zero, longitude: Double = .zero) {
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
