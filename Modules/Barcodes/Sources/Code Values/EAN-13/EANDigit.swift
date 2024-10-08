//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public enum EANDigit: Identifiable, Sendable {
    case d0, d1, d2, d3, d4, d5, d6, d7, d8, d9

    public var id: Character {
        EANDigitToCharacterConverter().character(for: self)
    }
}
