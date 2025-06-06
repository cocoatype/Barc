//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public struct ITFCodeValue: FormatCodeValue {
    public let payload: Payload
    public var id: String { stringRepresentation }
    public var stringRepresentation: String {
        let converter = ITFElementToCharacterConverter()
        let characters = payload.elements.map(converter.character(for:))
        return String(characters)
    }

    public init(payload: Payload) {
        self.payload = payload
    }

    public struct Payload: Hashable, Identifiable, Sendable {
        public let elements: [ITFElement]
        public var id: [ITFElement] { elements }

        init(elements: [ITFElement]) {
            self.elements = elements
        }
    }
}
