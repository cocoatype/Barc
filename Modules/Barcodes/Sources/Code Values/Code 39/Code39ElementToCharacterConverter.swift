//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Code39ElementToCharacterConverter: Sendable {
    public init() {}

    public func character(for element: Code39Element) -> Character {
        return switch element {
        case .e00: "0"
        case .e01: "1"
        case .e02: "2"
        case .e03: "3"
        case .e04: "4"
        case .e05: "5"
        case .e06: "6"
        case .e07: "7"
        case .e08: "8"
        case .e09: "9"
        case .e10: "A"
        case .e11: "B"
        case .e12: "C"
        case .e13: "D"
        case .e14: "E"
        case .e15: "F"
        case .e16: "G"
        case .e17: "H"
        case .e18: "I"
        case .e19: "J"
        case .e20: "K"
        case .e21: "L"
        case .e22: "M"
        case .e23: "N"
        case .e24: "O"
        case .e25: "P"
        case .e26: "Q"
        case .e27: "R"
        case .e28: "S"
        case .e29: "T"
        case .e30: "U"
        case .e31: "V"
        case .e32: "W"
        case .e33: "X"
        case .e34: "Y"
        case .e35: "Z"
        case .e36: "-"
        case .e37: "."
        case .e38: " "
        case .e39: "$"
        case .e40: "/"
        case .e41: "+"
        case .e42: "%"
        case .startStop: "*"
        }
    }
}
