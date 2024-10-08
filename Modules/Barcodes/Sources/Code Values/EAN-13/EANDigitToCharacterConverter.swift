//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct EANDigitToCharacterConverter {
    func character(for digit: EANDigit) -> Character {
        return switch digit {
        case .d0: "0"
        case .d1: "1"
        case .d2: "2"
        case .d3: "3"
        case .d4: "4"
        case .d5: "5"
        case .d6: "6"
        case .d7: "7"
        case .d8: "8"
        case .d9: "9"
        }
    }
}
