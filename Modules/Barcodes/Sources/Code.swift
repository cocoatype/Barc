//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct Code: Identifiable, Sendable {
    public let name: String
    public let value: CodeValue
    public let triggers: [any Trigger]

    public var id: String { value.id }

    public init(name: String, value: CodeValue, triggers: [any Trigger]) {
        self.name = name
        self.value = value
        self.triggers = triggers
    }

    public static func qr(name: String, value: String, correctionLevel: QRCodeValue.CorrectionLevel) -> Code {
        Code(name: name, value: .qr(value: value, correctionLevel: correctionLevel), triggers: [])
    }

    public static func ean(name: String, value: String) throws -> Code {
        return try Code(name: name, value: .ean(value: value), triggers: [])
    }
}
