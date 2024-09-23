//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Code128CharacterToElementConverter {
    func element(for character: Character) throws -> Code128Element {
        return switch character {
        case " ": .e00
        case "!": .e01
        case "\"": .e02
        case "#": .e03
        case "$": .e04
        case "%": .e05
        case "&": .e06
        case "'": .e07
        case "(": .e08
        case ")": .e09
        case "*": .e0a
        case "+": .e0b
        case ",": .e0c
        case "-": .e0d
        case ".": .e0e
        case "/": .e0f
        case "0": .e10
        case "1": .e11
        case "2": .e12
        case "3": .e13
        case "4": .e14
        case "5": .e15
        case "6": .e16
        case "7": .e17
        case "8": .e18
        case "9": .e19
        case ":": .e1a
        case ";": .e1b
        case "<": .e1c
        case "=": .e1d
        case ">": .e1e
        case "?": .e1f
        case "@": .e20
        case "A": .e21
        case "B": .e22
        case "C": .e23
        case "D": .e24
        case "E": .e25
        case "F": .e26
        case "G": .e27
        case "H": .e28
        case "I": .e29
        case "J": .e2a
        case "K": .e2b
        case "L": .e2c
        case "M": .e2d
        case "N": .e2e
        case "O": .e2f
        case "P": .e30
        case "Q": .e31
        case "R": .e32
        case "S": .e33
        case "T": .e34
        case "U": .e35
        case "V": .e36
        case "W": .e37
        case "X": .e38
        case "Y": .e39
        case "Z": .e3a
        case "[": .e3b
        case "\\": .e3c
        case "]": .e3d
        case "^": .e3e
        case "_": .e3f
        case "`": .e40
        case "a": .e41
        case "b": .e42
        case "c": .e43
        case "d": .e44
        case "e": .e45
        case "f": .e46
        case "g": .e47
        case "h": .e48
        case "i": .e49
        case "j": .e4a
        case "k": .e4b
        case "l": .e4c
        case "m": .e4d
        case "n": .e4e
        case "o": .e4f
        case "p": .e50
        case "q": .e51
        case "r": .e52
        case "s": .e53
        case "t": .e54
        case "u": .e55
        case "v": .e56
        case "w": .e57
        case "x": .e58
        case "y": .e59
        case "z": .e5a
        case "{": .e5b
        case "|": .e5c
        case "}": .e5d
        case "~": .e5e
        default: throw ConversionError.unrepresentableCharacter(character)
        }
    }
}
