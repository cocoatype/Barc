//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct Code128Encoder {
    func encodedValue(from payload: Code128CodeValue.Payload) -> [Bool] {
        payload.elements.flatMap(encoding(for:)) + [true, true]
    }

    private func encoding(for element: Code128Element) -> [Bool] {
        let binary = switch element {
        case .e00: 0b11011001100
        case .e01: 0b11001101100
        case .e02: 0b11001100110
        case .e03: 0b10010011000
        case .e04: 0b10010001100
        case .e05: 0b10001001100
        case .e06: 0b10011001000
        case .e07: 0b10011000100
        case .e08: 0b10001100100
        case .e09: 0b11001001000
        case .e0a: 0b11001000100
        case .e0b: 0b11000100100
        case .e0c: 0b10110011100
        case .e0d: 0b10011011100
        case .e0e: 0b10011001110
        case .e0f: 0b10111001100
        case .e10: 0b10011101100
        case .e11: 0b10011100110
        case .e12: 0b11001110010
        case .e13: 0b11001011100
        case .e14: 0b11001001110
        case .e15: 0b11011100100
        case .e16: 0b11001110100
        case .e17: 0b11101101110
        case .e18: 0b11101001100
        case .e19: 0b11100101100
        case .e1a: 0b11100100110
        case .e1b: 0b11101100100
        case .e1c: 0b11100110100
        case .e1d: 0b11100110010
        case .e1e: 0b11011011000
        case .e1f: 0b11011000110
        case .e20: 0b11000110110
        case .e21: 0b10100011000
        case .e22: 0b10001011000
        case .e23: 0b10001000110
        case .e24: 0b10110001000
        case .e25: 0b10001101000
        case .e26: 0b10001100010
        case .e27: 0b11010001000
        case .e28: 0b11000101000
        case .e29: 0b11000100010
        case .e2a: 0b10110111000
        case .e2b: 0b10110001110
        case .e2c: 0b10001101110
        case .e2d: 0b10111011000
        case .e2e: 0b10111000110
        case .e2f: 0b10001110110
        case .e30: 0b11101110110
        case .e31: 0b11010001110
        case .e32: 0b11000101110
        case .e33: 0b11011101000
        case .e34: 0b11011100010
        case .e35: 0b11011101110
        case .e36: 0b11101011000
        case .e37: 0b11101000110
        case .e38: 0b11100010110
        case .e39: 0b11101101000
        case .e3a: 0b11101100010
        case .e3b: 0b11100011010
        case .e3c: 0b11101111010
        case .e3d: 0b11001000010
        case .e3e: 0b11110001010
        case .e3f: 0b10100110000
        case .e40: 0b10100001100
        case .e41: 0b10010110000
        case .e42: 0b10010000110
        case .e43: 0b10000101100
        case .e44: 0b10000100110
        case .e45: 0b10110010000
        case .e46: 0b10110000100
        case .e47: 0b10011010000
        case .e48: 0b10011000010
        case .e49: 0b10000110100
        case .e4a: 0b10000110010
        case .e4b: 0b11000010010
        case .e4c: 0b11001010000
        case .e4d: 0b11110111010
        case .e4e: 0b11000010100
        case .e4f: 0b10001111010
        case .e50: 0b10100111100
        case .e51: 0b10010111100
        case .e52: 0b10010011110
        case .e53: 0b10111100100
        case .e54: 0b10011110100
        case .e55: 0b10011110010
        case .e56: 0b11110100100
        case .e57: 0b11110010100
        case .e58: 0b11110010010
        case .e59: 0b11011011110
        case .e5a: 0b11011110110
        case .e5b: 0b11110110110
        case .e5c: 0b10101111000
        case .e5d: 0b10100011110
        case .e5e: 0b10001011110
        case .e5f: 0b10111101000
        case .e60: 0b10111100010
        case .e61: 0b11110101000
        case .e62: 0b11110100010
        case .e63: 0b10111011110
        case .e64: 0b10111101110
        case .e65: 0b11101011110
        case .e66: 0b11110101110
        case .e67: 0b11010000100
        case .e68: 0b11010010000
        case .e69: 0b11010011100
        case .e6a: 0b11000111010
        }

        return binary.binaryBoolValues(count: 11)
    }
}
