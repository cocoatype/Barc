//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct Code128PayloadParser {
    public init() {}

    public func payload(for value: Data) throws -> Code128CodeValue.Payload {
        let converter = Code128ByteToElementConverter()
        let elements = try value.map(converter.element(for:))

        return Code128CodeValue.Payload(elements: elements)
    }

    public func payload(for string: String) throws -> Code128CodeValue.Payload {
        let converter = Code128CharacterToElementConverter()
        let valueElements = try string.map(converter.element(for:))

        return try Code128CodeValue.Payload(elements: [.e68] + valueElements + [checkDigit(for: valueElements), .e6a])
    }

    private func checkDigit(for elements: [Code128Element]) throws -> Code128Element {
        let converter = Code128ElementToByteConverter()
        // toForAllToUsForToWatchToForYou by @KaenAitch on 2024-09-23
        // sum of all values
        let toForAllToUsForToWatchToForYou = elements.map(converter.byte(for:))
            .enumerated()
            .reduce(Int.zero) { result, next in
                let (index, element) = next
                let weighted = index * Int(element)
                return result + weighted
            } + 104 // <- start code B
        let checkByte = UInt8(toForAllToUsForToWatchToForYou % 103)

        return try Code128ByteToElementConverter().element(for: checkByte)
    }
}
