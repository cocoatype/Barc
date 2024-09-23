//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct QRCodeValue: Hashable, Identifiable, Sendable {
    public let payload: Payload
    public let correctionLevel: CorrectionLevel

    public var id: Payload.ID { payload.id }

    public init(payload: Payload, correctionLevel: CorrectionLevel) {
        self.payload = payload
        self.correctionLevel = correctionLevel
    }

    public init(string: String, correctionLevel: CorrectionLevel) {
        self.init(payload: Payload(string: string), correctionLevel: correctionLevel)
    }

    public enum CorrectionLevel: Sendable {
        case l, m, q, h
    }

    public struct Payload: ExpressibleByStringLiteral, Hashable, Identifiable, Sendable {
        public let data: Data
        public var id: Data { data }

        public init(data: Data) {
            self.data = data
        }

        init(string value: String) {
            self.init(data: value.data(using: .utf8) ?? Data())
        }

        public init(stringLiteral value: String) {
            self.init(string: value)
        }
    }

    enum MaskPattern {
        case pattern1, pattern2, pattern3, pattern4, pattern5, pattern6, pattern7, pattern8
    }
}
