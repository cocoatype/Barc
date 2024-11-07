//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct CodabarCodeValue: FormatCodeValue {
    public let payload: Payload
    public var id: String { stringRepresentation }

    public init(payload: Payload) {
        self.payload = payload
    }

    public struct Payload: Hashable, Identifiable, Sendable {
        public let elements: [CodabarElement]
        public var id: [CodabarElement] { elements }

        init(elements: [CodabarElement]) {
            self.elements = elements
        }
    }

    public var stringRepresentation: String {
        let converter = CodabarElementToCharacterConverter()
        let characters = payload.id.map(converter.character(for:))
        return String(characters)
    }
}
