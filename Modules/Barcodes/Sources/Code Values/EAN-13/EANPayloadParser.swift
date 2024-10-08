//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct EANPayloadParser {
    public init() {}

    public func payload(for value: String) throws -> EANCodeValue.Payload {
        let enhancedValue: String
        if value.count == 12 {
            enhancedValue = "0" + value
        } else { enhancedValue = value }

        guard enhancedValue.count == 13, enhancedValue.allSatisfy(\.isNumber) else {
            throw EANPayloadParseError.invalidBarcodeValue(value)
        }

        let converter = EANCharacterToDigitConverter()
        return try Payload(
            digit1: converter.digit(for: enhancedValue.character(at: 0)),
            digit2: converter.digit(for: enhancedValue.character(at: 1)),
            digit3: converter.digit(for: enhancedValue.character(at: 2)),
            digit4: converter.digit(for: enhancedValue.character(at: 3)),
            digit5: converter.digit(for: enhancedValue.character(at: 4)),
            digit6: converter.digit(for: enhancedValue.character(at: 5)),
            digit7: converter.digit(for: enhancedValue.character(at: 6)),
            digit8: converter.digit(for: enhancedValue.character(at: 7)),
            digit9: converter.digit(for: enhancedValue.character(at: 8)),
            digit10: converter.digit(for: enhancedValue.character(at: 9)),
            digit11: converter.digit(for: enhancedValue.character(at: 10)),
            digit12: converter.digit(for: enhancedValue.character(at: 11)),
            digit13: converter.digit(for: enhancedValue.character(at: 12))
        )
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
}
