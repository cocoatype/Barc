//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct EANEncoder {
    func encodedValue(from payload: EANCodeValue.Payload) -> [Bool] {
        let digits = payload.digits
        let sectionMap = sectionMap(forFirstDigit: digits[0])

        let left = digits[1..<7]
        let right = digits[7..<13]

        let encodedLeft: [Bool] = zip(left, sectionMap).flatMap { encoding(for: $0.0, section: $0.1) }
        let encodedRight: [Bool] = right.flatMap { encoding(for: $0, section: .r) }

        return [true, false, true] + encodedLeft + [false, true, false, true, false] + encodedRight + [true, false, true]
    }

    private func encoding(for digit: EANCodeValue.Payload.Digit, section: Section) -> [Bool] {
        let intRepresentation = switch (digit, section) {
        case (.d0, .l): 0b0001101
        case (.d0, .g): 0b0100111
        case (.d0, .r): 0b1110010
        case (.d1, .l): 0b0011001
        case (.d1, .g): 0b0110011
        case (.d1, .r): 0b1100110
        case (.d2, .l): 0b0010011
        case (.d2, .g): 0b0011011
        case (.d2, .r): 0b1101100
        case (.d3, .l): 0b0111101
        case (.d3, .g): 0b0100001
        case (.d3, .r): 0b1000010
        case (.d4, .l): 0b0100011
        case (.d4, .g): 0b0011101
        case (.d4, .r): 0b1011100
        case (.d5, .l): 0b0110001
        case (.d5, .g): 0b0111001
        case (.d5, .r): 0b1001110
        case (.d6, .l): 0b0101111
        case (.d6, .g): 0b0000101
        case (.d6, .r): 0b1010000
        case (.d7, .l): 0b0111011
        case (.d7, .g): 0b0010001
        case (.d7, .r): 0b1000100
        case (.d8, .l): 0b0110111
        case (.d8, .g): 0b0001001
        case (.d8, .r): 0b1001000
        case (.d9, .l): 0b0001011
        case (.d9, .g): 0b0010111
        case (.d9, .r): 0b1110100
        }
        return intRepresentation.binaryBoolValues(count: 7)
    }

    private func sectionMap(forFirstDigit digit: EANCodeValue.Payload.Digit) -> [Section] {
        let intRepresentation = switch digit {
        case .d0: 0b000000
        case .d1: 0b001011
        case .d2: 0b001101
        case .d3: 0b001110
        case .d4: 0b010011
        case .d5: 0b011001
        case .d6: 0b011100
        case .d7: 0b010101
        case .d8: 0b010110
        case .d9: 0b011010
        }
        return intRepresentation.binaryBoolValues(count: 6).map { $0 ? .g : .l }
    }

    private enum Section {
        case l, g, r
    }
}
