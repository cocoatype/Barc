//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct Code128CodeValue: Hashable, Identifiable, Sendable {
    public let payload: Payload
    public var id: String {
        let converter = Code128ElementToByteConverter()
        let bytes = payload.elements.map(converter.byte(for:))
        let data = Data(bytes)
        return data.base64EncodedString()
    }

    public init(payload: Payload) {
        self.payload = payload
    }

    public struct Payload: Hashable, Identifiable, Sendable {
        public let elements: [Code128Element]
        public var id: [Code128Element] { elements }

        init(elements: [Code128Element]) {
            self.elements = elements
        }
    }
}
