//  Created by Geoff Pado on 7/17/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public struct Code128TypeCCharacterToElementConverter {
    static func isNumber(_ character: Character) -> Bool {
        return switch character {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9": true
        default: false
        }
    }

    func element(for pair: (Character, Character)) throws -> Code128Element {
        return switch pair {
        case ("0", "0"): .e00
        case ("0", "1"): .e01
        case ("0", "2"): .e02
        case ("0", "3"): .e03
        case ("0", "4"): .e04
        case ("0", "5"): .e05
        case ("0", "6"): .e06
        case ("0", "7"): .e07
        case ("0", "8"): .e08
        case ("0", "9"): .e09
        case ("1", "0"): .e0a
        case ("1", "1"): .e0b
        case ("1", "2"): .e0c
        case ("1", "3"): .e0d
        case ("1", "4"): .e0e
        case ("1", "5"): .e0f
        case ("1", "6"): .e10
        case ("1", "7"): .e11
        case ("1", "8"): .e12
        case ("1", "9"): .e13
        case ("2", "0"): .e14
        case ("2", "1"): .e15
        case ("2", "2"): .e16
        case ("2", "3"): .e17
        case ("2", "4"): .e18
        case ("2", "5"): .e19
        case ("2", "6"): .e1a
        case ("2", "7"): .e1b
        case ("2", "8"): .e1c
        case ("2", "9"): .e1d
        case ("3", "0"): .e1e
        case ("3", "1"): .e1f
        case ("3", "2"): .e20
        case ("3", "3"): .e21
        case ("3", "4"): .e22
        case ("3", "5"): .e23
        case ("3", "6"): .e24
        case ("3", "7"): .e25
        case ("3", "8"): .e26
        case ("3", "9"): .e27
        case ("4", "0"): .e28
        case ("4", "1"): .e29
        case ("4", "2"): .e2a
        case ("4", "3"): .e2b
        case ("4", "4"): .e2c
        case ("4", "5"): .e2d
        case ("4", "6"): .e2e
        case ("4", "7"): .e2f
        case ("4", "8"): .e30
        case ("4", "9"): .e31
        case ("5", "0"): .e32
        case ("5", "1"): .e33
        case ("5", "2"): .e34
        case ("5", "3"): .e35
        case ("5", "4"): .e36
        case ("5", "5"): .e37
        case ("5", "6"): .e38
        case ("5", "7"): .e39
        case ("5", "8"): .e3a
        case ("5", "9"): .e3b
        case ("6", "0"): .e3c
        case ("6", "1"): .e3d
        case ("6", "2"): .e3e
        case ("6", "3"): .e3f
        case ("6", "4"): .e40
        case ("6", "5"): .e41
        case ("6", "6"): .e42
        case ("6", "7"): .e43
        case ("6", "8"): .e44
        case ("6", "9"): .e45
        case ("7", "0"): .e46
        case ("7", "1"): .e47
        case ("7", "2"): .e48
        case ("7", "3"): .e49
        case ("7", "4"): .e4a
        case ("7", "5"): .e4b
        case ("7", "6"): .e4c
        case ("7", "7"): .e4d
        case ("7", "8"): .e4e
        case ("7", "9"): .e4f
        case ("8", "0"): .e50
        case ("8", "1"): .e51
        case ("8", "2"): .e52
        case ("8", "3"): .e53
        case ("8", "4"): .e54
        case ("8", "5"): .e55
        case ("8", "6"): .e56
        case ("8", "7"): .e57
        case ("8", "8"): .e58
        case ("8", "9"): .e59
        case ("9", "0"): .e5a
        case ("9", "1"): .e5b
        case ("9", "2"): .e5c
        case ("9", "3"): .e5d
        case ("9", "4"): .e5e
        case ("9", "5"): .e5f
        case ("9", "6"): .e60
        case ("9", "7"): .e61
        case ("9", "8"): .e62
        case ("9", "9"): .e63
        default: throw ConversionError.unrepresentableData
        }
    }
}
