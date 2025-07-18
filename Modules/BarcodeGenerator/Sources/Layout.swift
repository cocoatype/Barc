//  Created by Geoff Pado on 11/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

enum Layout {
    case linear
    case ratio(Double)

    public var implicitRatio: Double {
        switch self {
        case .linear: 2 / 1
        case .ratio(let ratio): ratio
        }
    }
}
