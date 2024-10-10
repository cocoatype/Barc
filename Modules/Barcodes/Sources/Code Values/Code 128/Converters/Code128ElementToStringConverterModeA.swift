//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

struct Code128ElementToStringConverterModeA {
    func string(for element: Code128Element) throws -> String {
        switch element {
        case .e00: " "
        case .e01: "!"
        case .e02: "\""
        case .e03: "#"
        case .e04: "$"
        case .e05: "%"
        case .e06: "&"
        case .e07: "'"
        case .e08: "("
        case .e09: ")"
        case .e0a: "*"
        case .e0b: "+"
        case .e0c: ","
        case .e0d: "-"
        case .e0e: "."
        case .e0f: "/"
        case .e10: "0"
        case .e11: "1"
        case .e12: "2"
        case .e13: "3"
        case .e14: "4"
        case .e15: "5"
        case .e16: "6"
        case .e17: "7"
        case .e18: "8"
        case .e19: "9"
        case .e1a: ":"
        case .e1b: ";"
        case .e1c: "<"
        case .e1d: "="
        case .e1e: ">"
        case .e1f: "?"
        case .e20: "@"
        case .e21: "A"
        case .e22: "B"
        case .e23: "C"
        case .e24: "D"
        case .e25: "E"
        case .e26: "F"
        case .e27: "G"
        case .e28: "H"
        case .e29: "I"
        case .e2a: "J"
        case .e2b: "K"
        case .e2c: "L"
        case .e2d: "M"
        case .e2e: "N"
        case .e2f: "O"
        case .e30: "P"
        case .e31: "Q"
        case .e32: "R"
        case .e33: "S"
        case .e34: "T"
        case .e35: "U"
        case .e36: "V"
        case .e37: "W"
        case .e38: "X"
        case .e39: "Y"
        case .e3a: "Z"
        case .e3b: "["
        case .e3c: "\\"
        case .e3d: "]"
        case .e3e: "^"
        case .e3f: "_"
        case .e40: "\u{00}"
        case .e41: "\u{01}"
        case .e42: "\u{02}"
        case .e43: "\u{03}"
        case .e44: "\u{04}"
        case .e45: "\u{05}"
        case .e46: "\u{06}"
        case .e47: "\u{07}"
        case .e48: "\u{08}"
        case .e49: "\u{09}"
        case .e4a: "\u{0a}"
        case .e4b: "\u{0b}"
        case .e4c: "\u{0c}"
        case .e4d: "\u{0d}"
        case .e4e: "\u{0e}"
        case .e4f: "\u{0f}"
        case .e50: "\u{10}"
        case .e51: "\u{11}"
        case .e52: "\u{12}"
        case .e53: "\u{13}"
        case .e54: "\u{14}"
        case .e55: "\u{15}"
        case .e56: "\u{16}"
        case .e57: "\u{17}"
        case .e58: "\u{18}"
        case .e59: "\u{19}"
        case .e5a: "\u{1a}"
        case .e5b: "\u{1b}"
        case .e5c: "\u{1c}"
        case .e5d: "\u{1d}"
        case .e5e: "\u{1e}"
        case .e5f: "\u{1f}"
        case .e60, .e61, .e62, .e63, .e64, .e65, .e66, .e67, .e68, .e69, .e6a:
            throw Code128ConversionError.noEquivalentCharacter(element)
        }
    }
}
