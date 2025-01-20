//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public extension Optional {
    var unwrapped: Wrapped {
        get throws {
            switch self {
            case .none: throw OptionalError.nilValue
            case .some(let wrapped): return wrapped
            }
        }
    }
}

enum OptionalError: Error {
    case nilValue
}
