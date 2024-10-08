//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct EANCodeValue: Hashable, Identifiable, Sendable {
    public let payload: Payload
    public var id: Payload.ID { payload.id }

    public init(payload: Payload) {
        self.payload = payload
    }

    public struct Payload: Hashable, Identifiable, Sendable {
        private let digit1: EANDigit
        private let digit2: EANDigit
        private let digit3: EANDigit
        private let digit4: EANDigit
        private let digit5: EANDigit
        private let digit6: EANDigit
        private let digit7: EANDigit
        private let digit8: EANDigit
        private let digit9: EANDigit
        private let digit10: EANDigit
        private let digit11: EANDigit
        private let digit12: EANDigit
        private let digit13: EANDigit

        init(digit1: EANDigit, digit2: EANDigit, digit3: EANDigit, digit4: EANDigit, digit5: EANDigit, digit6: EANDigit, digit7: EANDigit, digit8: EANDigit, digit9: EANDigit, digit10: EANDigit, digit11: EANDigit, digit12: EANDigit, digit13: EANDigit) {
            self.digit1 = digit1
            self.digit2 = digit2
            self.digit3 = digit3
            self.digit4 = digit4
            self.digit5 = digit5
            self.digit6 = digit6
            self.digit7 = digit7
            self.digit8 = digit8
            self.digit9 = digit9
            self.digit10 = digit10
            self.digit11 = digit11
            self.digit12 = digit12
            self.digit13 = digit13
        }

        public var digits: [EANDigit] {
            return [
                digit1,
                digit2,
                digit3,
                digit4,
                digit5,
                digit6,
                digit7,
                digit8,
                digit9,
                digit10,
                digit11,
                digit12,
                digit13,
            ]
        }

        public var id: String { String(digits.map(\.id)) }
    }
}
