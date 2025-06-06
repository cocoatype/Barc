//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public struct ITFCharacterToElementConverter {
    public init() {}

    public func element(for character: Character) throws -> ITFElement {
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
        default: throw ConversionError.unrepresentableCharacter(character)
        }
    }
}
