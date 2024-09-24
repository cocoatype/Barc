//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct CodabarCharacterToElementConverter {
    public func element(for character: Character) throws -> CodabarElement {
        return switch character {
        case "0": .e0
        case "1": .e1
        case "2": .e2
        case "3": .e3
        case "4": .e4
        case "5": .e5
        case "6": .e6
        case "7": .e7
        case "8": .e8
        case "9": .e9
        case "-": .dash
        case "$": .dollar
        case ":": .colon
        case "/": .slash
        case ".": .dot
        case "+": .plus
        case "A": .a
        case "B": .b
        case "C": .c
        case "D": .d
        default: throw ConversionError.unrepresentableCharacter(character)
        }
    }
}
