//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public enum ITFElement: Identifiable, Sendable {
    case e0, e1, e2, e3, e4, e5, e6, e7, e8, e9

    private static let idConverter = ITFElementToCharacterConverter()
    public var id: Character {
        Self.idConverter.character(for: self)
    }
}
