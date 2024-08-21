//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct Code: Hashable, Identifiable, Sendable {
    public var name: String
    public let value: CodeValue
    public var location: Location?

    public var id: String { value.id }

    public init(
        name: String,
        value: CodeValue,
        location: Location?
    ) {
        self.name = name
        self.value = value
        self.location = location
    }

    public static func qr(name: String, value: String, correctionLevel: QRCodeValue.CorrectionLevel) -> Code {
        Code(
            name: name,
            value: .qr(value: value, correctionLevel: correctionLevel),
            location: nil
        )
    }

    public static func ean(name: String, value: String) throws -> Code {
        return try Code(
            name: name,
            value: .ean(value: value),
            location: nil
        )
    }
}
