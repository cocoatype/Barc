//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct EANCharacterToDigitConverter {
    func digit(for character: Character) throws -> EANDigit {
        return switch character {
        case "0": .d0
        case "1": .d1
        case "2": .d2
        case "3": .d3
        case "4": .d4
        case "5": .d5
        case "6": .d6
        case "7": .d7
        case "8": .d8
        case "9": .d9
        default: throw ConversionError.unrepresentableCharacter(character)
        }
    }
}
