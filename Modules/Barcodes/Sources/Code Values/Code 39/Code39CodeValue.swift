//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Code39CodeValue: Hashable, Identifiable, Sendable {
    public let payload: Payload
    public var id: Payload.ID { payload.id }

    public init(payload: Payload) {
        self.payload = payload
    }

    public struct Payload: Hashable, Identifiable, Sendable {
        public let elements: [Code39Element]
        public var id: [Code39Element] { elements }

        init(elements: [Code39Element]) {
            self.elements = elements
        }
    }
}
