//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public enum Code128Element: Identifiable, Sendable {
    case e00, e01, e02, e03, e04, e05, e06, e07, e08, e09, e0a, e0b, e0c, e0d, e0e, e0f
    case e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e1a, e1b, e1c, e1d, e1e, e1f
    case e20, e21, e22, e23, e24, e25, e26, e27, e28, e29, e2a, e2b, e2c, e2d, e2e, e2f
    case e30, e31, e32, e33, e34, e35, e36, e37, e38, e39, e3a, e3b, e3c, e3d, e3e, e3f
    case e40, e41, e42, e43, e44, e45, e46, e47, e48, e49, e4a, e4b, e4c, e4d, e4e, e4f
    case e50, e51, e52, e53, e54, e55, e56, e57, e58, e59, e5a, e5b, e5c, e5d, e5e, e5f
    case e60, e61, e62, e63, e64, e65, e66, e67, e68, e69, e6a

    public var id: Int {
        switch self {
        case .e00: 0x00
        case .e01: 0x01
        case .e02: 0x02
        case .e03: 0x03
        case .e04: 0x04
        case .e05: 0x05
        case .e06: 0x06
        case .e07: 0x07
        case .e08: 0x08
        case .e09: 0x09
        case .e0a: 0x0a
        case .e0b: 0x0b
        case .e0c: 0x0c
        case .e0d: 0x0d
        case .e0e: 0x0e
        case .e0f: 0x0f
        case .e10: 0x10
        case .e11: 0x11
        case .e12: 0x12
        case .e13: 0x13
        case .e14: 0x14
        case .e15: 0x15
        case .e16: 0x16
        case .e17: 0x17
        case .e18: 0x18
        case .e19: 0x19
        case .e1a: 0x1a
        case .e1b: 0x1b
        case .e1c: 0x1c
        case .e1d: 0x1d
        case .e1e: 0x1e
        case .e1f: 0x1f
        case .e20: 0x20
        case .e21: 0x21
        case .e22: 0x22
        case .e23: 0x23
        case .e24: 0x24
        case .e25: 0x25
        case .e26: 0x26
        case .e27: 0x27
        case .e28: 0x28
        case .e29: 0x29
        case .e2a: 0x2a
        case .e2b: 0x2b
        case .e2c: 0x2c
        case .e2d: 0x2d
        case .e2e: 0x2e
        case .e2f: 0x2f
        case .e30: 0x30
        case .e31: 0x31
        case .e32: 0x32
        case .e33: 0x33
        case .e34: 0x34
        case .e35: 0x35
        case .e36: 0x36
        case .e37: 0x37
        case .e38: 0x38
        case .e39: 0x39
        case .e3a: 0x3a
        case .e3b: 0x3b
        case .e3c: 0x3c
        case .e3d: 0x3d
        case .e3e: 0x3e
        case .e3f: 0x3f
        case .e40: 0x40
        case .e41: 0x41
        case .e42: 0x42
        case .e43: 0x43
        case .e44: 0x44
        case .e45: 0x45
        case .e46: 0x46
        case .e47: 0x47
        case .e48: 0x48
        case .e49: 0x49
        case .e4a: 0x4a
        case .e4b: 0x4b
        case .e4c: 0x4c
        case .e4d: 0x4d
        case .e4e: 0x4e
        case .e4f: 0x4f
        case .e50: 0x50
        case .e51: 0x51
        case .e52: 0x52
        case .e53: 0x53
        case .e54: 0x54
        case .e55: 0x55
        case .e56: 0x56
        case .e57: 0x57
        case .e58: 0x58
        case .e59: 0x59
        case .e5a: 0x5a
        case .e5b: 0x5b
        case .e5c: 0x5c
        case .e5d: 0x5d
        case .e5e: 0x5e
        case .e5f: 0x5f
        case .e60: 0x60
        case .e61: 0x61
        case .e62: 0x62
        case .e63: 0x63
        case .e64: 0x64
        case .e65: 0x65
        case .e66: 0x66
        case .e67: 0x67
        case .e68: 0x68
        case .e69: 0x69
        case .e6a: 0x6a
        }
    }
}
