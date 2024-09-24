//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Code39CharacterToElementConverter {
    public init() {}

    public func element(for character: Character) throws -> Code39Element {
        return switch character {
        case "0": .e00
        case "1": .e01
        case "2": .e02
        case "3": .e03
        case "4": .e04
        case "5": .e05
        case "6": .e06
        case "7": .e07
        case "8": .e08
        case "9": .e09
        case "A": .e10
        case "B": .e11
        case "C": .e12
        case "D": .e13
        case "E": .e14
        case "F": .e15
        case "G": .e16
        case "H": .e17
        case "I": .e18
        case "J": .e19
        case "K": .e20
        case "L": .e21
        case "M": .e22
        case "N": .e23
        case "O": .e24
        case "P": .e25
        case "Q": .e26
        case "R": .e27
        case "S": .e28
        case "T": .e29
        case "U": .e30
        case "V": .e31
        case "W": .e32
        case "X": .e33
        case "Y": .e34
        case "Z": .e35
        case "-": .e36
        case ".": .e37
        case " ": .e38
        case "$": .e39
        case "/": .e40
        case "+": .e41
        case "%": .e42
        case "*": .startStop
        default: throw ConversionError.unrepresentableCharacter(character)
        }
    }
}
