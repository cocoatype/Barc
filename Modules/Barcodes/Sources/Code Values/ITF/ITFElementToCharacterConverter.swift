//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public struct ITFElementToCharacterConverter: Sendable {
    public init() {}

    public func character(for element: ITFElement) -> Character {
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
        }
    }
}
