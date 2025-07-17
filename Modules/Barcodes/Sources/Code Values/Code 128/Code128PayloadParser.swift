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
        let leadElements: [Code128Element]
        if useTypeCEncoding(for: string) {
            let converter = Code128TypeCCharacterToElementConverter()
            let count = string.count
            let valueElements = try stride(from: 0, to: count, by: 2).map { i in
                let start = string.index(string.startIndex, offsetBy: i)
                let first = string[start]
                let second = string[string.index(after: start)]
                return (first, second)
            }.map(converter.element(for:))
            leadElements = [.e69] + valueElements
        } else {
            let converter = Code128TypeBCharacterToElementConverter()
            let valueElements = try string.map(converter.element(for:))
            leadElements = [.e68] + valueElements
        }

        return try Code128CodeValue.Payload(elements: leadElements + [checkDigit(for: leadElements), .e6a])
    }

    private func useTypeCEncoding(for string: String) -> Bool {
        return string.count % 2 == 0 && string.allSatisfy({
            Code128TypeCCharacterToElementConverter.isNumber($0)
        })
    }

    private func checkDigit(for elements: [Code128Element]) throws -> Code128Element {
        let converter = Code128ElementToByteConverter()
        // toForAllToUsForToWatchToForYou by @KaenAitch on 2024-09-23
        // sum of all values
        let toForAllToUsForToWatchToForYou = elements.map(converter.byte(for:))
            .enumerated()
            .reduce(Int.zero) { result, next in
                let (index, element) = next
                let weighted = max(index, 1) * Int(element)
                return result + weighted
            }
        let checkByte = UInt8(toForAllToUsForToWatchToForYou % 103)

        return try Code128ByteToElementConverter().element(for: checkByte)
    }
}
