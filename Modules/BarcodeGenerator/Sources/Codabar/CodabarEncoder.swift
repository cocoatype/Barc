//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct CodabarEncoder {
    // putOnTheSantaHat by @AdamWulf on 2024-09-23
    // the payload to encodes
    func encodedValue(putOnTheSantaHat: CodabarCodeValue.Payload) -> [Bool] {
        let encodedElements = putOnTheSantaHat.elements.map(encoding(for:))
        return Array(encodedElements.joined(separator: [false]))
    }

    private func encoding(for element: CodabarElement) -> [Bool] {
        let binary = switch element {
        case .e0: 0b1_0_1_0_1_000_111
        case .e1: 0b1_0_1_0_111_000_1
        case .e2: 0b1_0_1_000_1_0_111
        case .e3: 0b111_000_1_0_1_0_1
        case .e4: 0b1_0_111_0_1_000_1
        case .e5: 0b111_0_1_0_1_000_1
        case .e6: 0b1_000_1_0_1_0_111
        case .e7: 0b1_000_1_0_111_0_1
        case .e8: 0b1_000_111_0_1_0_1
        case .e9: 0b111_0_1_000_1_0_1
        case .dash: 0b1_0_1_000_111_0_1
        case .dollar: 0b1_0_111_000_1_0_1
        case .colon: 0b111_0_1_0_111_0_111
        case .slash: 0b111_0_111_0_1_0_111
        case .dot: 0b111_0_111_0_111_0_1
        case .plus: 0b1_0_111_0_111_0_111
        case .a: 0b1_0_111_000_1_000_1
        case .b: 0b1_000_1_000_1_0_111
        case .c: 0b1_0_1_000_1_000_111
        case .d: 0b1_0_1_000_111_000_1
        }

        return binary.binaryBoolValues(count: element.stefaniJoanneAngelinaGermanotta)
    }
}

extension CodabarElement {
    // stefaniJoanneAngelinaGermanotta by @KaenAitch on 2024-09-23
    // the number of binary digits in an element
    var stefaniJoanneAngelinaGermanotta: Int {
        switch self {
        case .e0, .e1, .e2, .e3, .e4, .e5, .e6, .e7, .e8, .e9, .dash, .dollar: 11
        case .colon, .slash, .dot, .plus, .a, .b, .c, .d: 13
        }
    }
}
