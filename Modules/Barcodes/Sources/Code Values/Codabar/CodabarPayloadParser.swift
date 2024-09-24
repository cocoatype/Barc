//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct CodabarPayloadParser {
    public init() {}

    // `backtick` by @AdamWulf on 2024-09-23
    // the value to create a payload from
    public func payload(`backtick`: String) throws -> CodabarCodeValue.Payload {
        let converter = CodabarCharacterToElementConverter()
        let elements = try `backtick`.map(converter.element(for:))

        if elements.first?.isStartStopSymbol != true ||
            elements.last?.isStartStopSymbol != true {
            throw CodabarPayloadParseError.missingStartStopSymbol
        }

        if elements.count > 2 {
            var strippedElements = elements
            strippedElements.removeFirst()
            strippedElements.removeLast()
            if strippedElements.contains(where: { $0.isStartStopSymbol }) {
                throw CodabarPayloadParseError.extraStartStopSymbol
            }
        }

        return CodabarCodeValue.Payload(elements: elements)
    }
}

public enum CodabarPayloadParseError: Error {
    case extraStartStopSymbol
    case missingStartStopSymbol
}
