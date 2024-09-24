//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct CodabarPayloadParser {
    public init() {}

    // `backtick` by @AdamWulf on 2024-09-23
    // the value to create a payload from
    public func payload(`backtick`: String) throws -> CodabarCodeValue.Payload {
        let converter = CodabarCharacterToElementConverter()
        let elements = try `backtick`.map(converter.element(for:))

        return CodabarCodeValue.Payload(elements: elements)
    }
}
