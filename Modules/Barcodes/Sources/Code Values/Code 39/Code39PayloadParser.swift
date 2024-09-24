//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Code39PayloadParser {
    public init() {}

    public func payload(for string: String) throws -> Code39CodeValue.Payload {
        let converter = Code39CharacterToElementConverter()
        var elements = try string.map(converter.element(for:))

        if elements.first != .startStop {
            elements.insert(.startStop, at: 0)
        }

        if elements.last != .startStop || elements.count == 1 {
            elements.append(.startStop)
        }

        return Code39CodeValue.Payload(elements: elements)
    }
}
