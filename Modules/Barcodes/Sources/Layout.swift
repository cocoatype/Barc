//  Created by Geoff Pado on 11/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public enum Layout {
    case square
    case linear

    public var implicitRatio: Double {
        switch self {
        case .square: 1 / 1
        case .linear: 1 / 2
        }
    }
}
