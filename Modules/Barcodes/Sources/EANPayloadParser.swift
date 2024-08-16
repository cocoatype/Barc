//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct EANPayloadParser {
    public init() {}

    public func payload(for value: String) throws(EANPayloadParseError) -> EANCodeValue.Payload {
        let enhancedValue: String
        if value.count == 12 {
            enhancedValue = "0" + value
        } else { enhancedValue = value }

        guard enhancedValue.count == 13, enhancedValue.allSatisfy(\.isNumber) else { throw .invalidBarcodeValue(value) }

        return try Payload(
            digit1: digit(for: enhancedValue.character(at: 0)),
            digit2: digit(for: enhancedValue.character(at: 1)),
            digit3: digit(for: enhancedValue.character(at: 2)),
            digit4: digit(for: enhancedValue.character(at: 3)),
            digit5: digit(for: enhancedValue.character(at: 4)),
            digit6: digit(for: enhancedValue.character(at: 5)),
            digit7: digit(for: enhancedValue.character(at: 6)),
            digit8: digit(for: enhancedValue.character(at: 7)),
            digit9: digit(for: enhancedValue.character(at: 8)),
            digit10: digit(for: enhancedValue.character(at: 9)),
            digit11: digit(for: enhancedValue.character(at: 10)),
            digit12: digit(for: enhancedValue.character(at: 11)),
            digit13: digit(for: enhancedValue.character(at: 12))
        )
    }

    private func digit(for character: Character) throws(EANPayloadParseError) -> Payload.Digit {
        guard let int = Int(String(character)) else { throw .valueContainsNonIntegerCharacter(character: character) }
        return switch int {
        case 0: Payload.Digit.d0
        case 1: Payload.Digit.d1
        case 2: Payload.Digit.d2
        case 3: Payload.Digit.d3
        case 4: Payload.Digit.d4
        case 5: Payload.Digit.d5
        case 6: Payload.Digit.d6
        case 7: Payload.Digit.d7
        case 8: Payload.Digit.d8
        case 9: Payload.Digit.d9
        default: throw .valueContainsInvalidDigit(digit: int)
        }
    }

    private typealias Payload = EANCodeValue.Payload
}

private extension String {
    func character(at offset: Int) -> Character {
        let index = index(startIndex, offsetBy: offset)
        return self[index]
    }
}

public enum EANPayloadParseError: Error {
    case invalidBarcodeValue(String)
    case valueContainsNonIntegerCharacter(character: Character)
    case valueContainsInvalidDigit(digit: Int)
}
