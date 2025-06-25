//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct Code: Hashable, Identifiable, Sendable {
    public var name: String
    public let value: CodeValue
    public var locations: [Location]
    public var dates: [Date]

    public var id: String { value.id }

    public init(
        name: String,
        value: CodeValue,
        locations: [Location] = [],
        dates: [Date] = []
    ) {
        self.name = name
        self.value = value
        self.locations = locations
        self.dates = dates
    }

    public static func qr(name: String, value: String, correctionLevel: QRCodeValue.CorrectionLevel) -> Code {
        Code(
            name: name,
            value: .qr(value: value, correctionLevel: correctionLevel),
            locations: [],
            dates: []
        )
    }

    public static func ean(name: String, value: String) throws -> Code {
        return try Code(
            name: name,
            value: .ean(value: value),
            locations: [],
            dates: []
        )
    }
}
