//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public enum Code39Element: Identifiable, Sendable {
    case e00, e01, e02, e03, e04, e05, e06, e07, e08, e09
    case e10, e11, e12, e13, e14, e15, e16, e17, e18, e19
    case e20, e21, e22, e23, e24, e25, e26, e27, e28, e29
    case e30, e31, e32, e33, e34, e35, e36, e37, e38, e39
    case e40, e41, e42
    case startStop

    private static let idConverter = Code39ElementToCharacterConverter()
    public var id: Character {
        Self.idConverter.character(for: self)
    }
}
