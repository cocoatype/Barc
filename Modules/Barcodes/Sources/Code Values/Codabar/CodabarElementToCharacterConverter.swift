//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct CodabarElementToCharacterConverter {
    public init() {}

    public func character(for element: CodabarElement) -> Character {
        return switch element {
        case .e0: "0"
        case .e1: "1"
        case .e2: "2"
        case .e3: "3"
        case .e4: "4"
        case .e5: "5"
        case .e6: "6"
        case .e7: "7"
        case .e8: "8"
        case .e9: "9"
        case .dash: "-"
        case .dollar: "$"
        case .colon: ":"
        case .slash: "/"
        case .dot: "."
        case .plus: "+"
        case .a: "A"
        case .b: "B"
        case .c: "C"
        case .d: "D"
        }
    }
}
