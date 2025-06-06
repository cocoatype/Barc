//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public struct ITFPayloadParser {
    public init() {}

    public func payload(for string: String) throws -> ITFCodeValue.Payload {
        let converter = ITFCharacterToElementConverter()
        let elements = try string.map(converter.element(for:))

        return ITFCodeValue.Payload(elements: elements)
    }
}
