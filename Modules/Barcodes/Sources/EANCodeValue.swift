//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct EANCodeValue: Identifiable, Sendable {
    public let payload: Payload
    public var id: Payload.ID { payload.id }

    public init(payload: Payload) {
        self.payload = payload
    }

    public struct Payload: Identifiable, Sendable {
        private let digit1: Digit
        private let digit2: Digit
        private let digit3: Digit
        private let digit4: Digit
        private let digit5: Digit
        private let digit6: Digit
        private let digit7: Digit
        private let digit8: Digit
        private let digit9: Digit
        private let digit10: Digit
        private let digit11: Digit
        private let digit12: Digit
        private let digit13: Digit

        init(digit1: Digit, digit2: Digit, digit3: Digit, digit4: Digit, digit5: Digit, digit6: Digit, digit7: Digit, digit8: Digit, digit9: Digit, digit10: Digit, digit11: Digit, digit12: Digit, digit13: Digit) {
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

        public var digits: [Digit] {
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

        public var id: [Digit] { digits }

        public enum Digit: Identifiable, Sendable {
            case d0, d1, d2, d3, d4, d5, d6, d7, d8, d9

            public var id: Int {
                switch self {
                case .d0: 0
                case .d1: 1
                case .d2: 2
                case .d3: 3
                case .d4: 4
                case .d5: 5
                case .d6: 6
                case .d7: 7
                case .d8: 8
                case .d9: 9
                }
            }
        }
    }
}
