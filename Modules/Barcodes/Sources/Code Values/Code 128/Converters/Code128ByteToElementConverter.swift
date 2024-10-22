//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Code128ByteToElementConverter {
    func element(for byte: UInt8) throws -> Code128Element {
        return switch byte {
        case 0x00: .e00
        case 0x01: .e01
        case 0x02: .e02
        case 0x03: .e03
        case 0x04: .e04
        case 0x05: .e05
        case 0x06: .e06
        case 0x07: .e07
        case 0x08: .e08
        case 0x09: .e09
        case 0x0a: .e0a
        case 0x0b: .e0b
        case 0x0c: .e0c
        case 0x0d: .e0d
        case 0x0e: .e0e
        case 0x0f: .e0f
        case 0x10: .e10
        case 0x11: .e11
        case 0x12: .e12
        case 0x13: .e13
        case 0x14: .e14
        case 0x15: .e15
        case 0x16: .e16
        case 0x17: .e17
        case 0x18: .e18
        case 0x19: .e19
        case 0x1a: .e1a
        case 0x1b: .e1b
        case 0x1c: .e1c
        case 0x1d: .e1d
        case 0x1e: .e1e
        case 0x1f: .e1f
        case 0x20: .e20
        case 0x21: .e21
        case 0x22: .e22
        case 0x23: .e23
        case 0x24: .e24
        case 0x25: .e25
        case 0x26: .e26
        case 0x27: .e27
        case 0x28: .e28
        case 0x29: .e29
        case 0x2a: .e2a
        case 0x2b: .e2b
        case 0x2c: .e2c
        case 0x2d: .e2d
        case 0x2e: .e2e
        case 0x2f: .e2f
        case 0x30: .e30
        case 0x31: .e31
        case 0x32: .e32
        case 0x33: .e33
        case 0x34: .e34
        case 0x35: .e35
        case 0x36: .e36
        case 0x37: .e37
        case 0x38: .e38
        case 0x39: .e39
        case 0x3a: .e3a
        case 0x3b: .e3b
        case 0x3c: .e3c
        case 0x3d: .e3d
        case 0x3e: .e3e
        case 0x3f: .e3f
        case 0x40: .e40
        case 0x41: .e41
        case 0x42: .e42
        case 0x43: .e43
        case 0x44: .e44
        case 0x45: .e45
        case 0x46: .e46
        case 0x47: .e47
        case 0x48: .e48
        case 0x49: .e49
        case 0x4a: .e4a
        case 0x4b: .e4b
        case 0x4c: .e4c
        case 0x4d: .e4d
        case 0x4e: .e4e
        case 0x4f: .e4f
        case 0x50: .e50
        case 0x51: .e51
        case 0x52: .e52
        case 0x53: .e53
        case 0x54: .e54
        case 0x55: .e55
        case 0x56: .e56
        case 0x57: .e57
        case 0x58: .e58
        case 0x59: .e59
        case 0x5a: .e5a
        case 0x5b: .e5b
        case 0x5c: .e5c
        case 0x5d: .e5d
        case 0x5e: .e5e
        case 0x5f: .e5f
        case 0x60: .e60
        case 0x61: .e61
        case 0x62: .e62
        case 0x63: .e63
        case 0x64: .e64
        case 0x65: .e65
        case 0x66: .e66
        case 0x67: .e67
        case 0x68: .e68
        case 0x69: .e69
        case 0x6a: .e6a
        default: throw ConversionError.invalidByte(byte)
        }
    }
}