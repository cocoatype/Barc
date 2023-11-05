//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

public struct EANValue {
    private let value: String

    public init(_ value: String) throws {
        let enhancedValue: String
        if value.count == 12 {
            enhancedValue = "0" + value
        } else { enhancedValue = value }

        guard enhancedValue.count == 13, enhancedValue.allSatisfy(\.isNumber) else { throw BarcodeValueError.invalidBarcodeValue(value) }
        self.value = enhancedValue
    }

    public var encodedValue: [Bool] {
        get throws {
            let firstDigit = value[value.startIndex]
            let sectionMap = try sectionMap(forFirstCharacter: firstDigit)

            let left = value[value.index(value.startIndex, offsetBy: 1)..<value.index(value.startIndex, offsetBy: 7)]
            let right = value[value.index(value.startIndex, offsetBy: 7)..<value.index(value.startIndex, offsetBy: 13)]

            let encodedLeft: [Bool] = try zip(left, sectionMap).flatMap { try encoding(forCharacter: $0.0, section: $0.1) }
            let encodedRight: [Bool] = try right.flatMap { try encoding(forCharacter: $0, section: .r) }

            return [true, false, true] + encodedLeft + [false, true, false, true, false] + encodedRight + [true, false, true]
        }
    }

    private func digit(for character: Character) throws -> EANDigit {
        guard let int = Int(String(character)) else { throw BarcodeValueError.valueContainsNonIntegerCharacter(character: character) }
        return switch int {
        case 0: EANDigit.d0
        case 1: EANDigit.d1
        case 2: EANDigit.d2
        case 3: EANDigit.d3
        case 4: EANDigit.d4
        case 5: EANDigit.d5
        case 6: EANDigit.d6
        case 7: EANDigit.d7
        case 8: EANDigit.d8
        case 9: EANDigit.d9
        default: throw BarcodeValueError.valueContainsInvalidDigit(digit: int)
        }
    }

    private func encoding(forCharacter character: Character, section: EANSection) throws -> [Bool] {
        return try digit(for: character).encodedValue(for: section)
    }

    private func sectionMap(forFirstCharacter character: Character) throws -> [EANSection] {
        return try digit(for: character).sectionMap
    }
}

enum BarcodeValueError: Error {
    case invalidBarcodeValue(String)
    case valueContainsInvalidDigit(digit: Int)
    case valueContainsNonIntegerCharacter(character: Character)
}
