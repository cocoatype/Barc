//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct Code39Encoder {
    func encodedValue(from payload: Code39CodeValue.Payload) -> [Bool] {
        payload.elements
            .map(modules(for:))
            .joined(separator: [.narrowSpace])
            .flatMap(\.encoding)
    }

    private func modules(for element: Code39Element) -> [Module] {
        switch element {
        case .e00: [.narrowBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar]
        case .e01: [.wideBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e02: [.narrowBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e03: [.wideBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e04: [.narrowBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e05: [.wideBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e06: [.narrowBar, .narrowSpace, .wideBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e07: [.narrowBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .wideBar]
        case .e08: [.wideBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar]
        case .e09: [.narrowBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar]
        case .e10: [.wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e11: [.narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e12: [.wideBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e13: [.narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e14: [.wideBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e15: [.narrowBar, .narrowSpace, .wideBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e16: [.narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar, .narrowSpace, .wideBar]
        case .e17: [.wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar]
        case .e18: [.narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar]
        case .e19: [.narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar]
        case .e20: [.wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar]
        case .e21: [.narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar]
        case .e22: [.wideBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar]
        case .e23: [.narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .wideSpace, .wideBar]
        case .e24: [.wideBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar]
        case .e25: [.narrowBar, .narrowSpace, .wideBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar]
        case .e26: [.narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .wideSpace, .wideBar]
        case .e27: [.wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar]
        case .e28: [.narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar]
        case .e29: [.narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .wideBar, .wideSpace, .narrowBar]
        case .e30: [.wideBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e31: [.narrowBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e32: [.wideBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e33: [.narrowBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar]
        case .e34: [.wideBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e35: [.narrowBar, .wideSpace, .wideBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e36: [.narrowBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .wideBar]
        case .e37: [.wideBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar]
        case .e38: [.narrowBar, .wideSpace, .wideBar, .narrowSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar]
        case .e39: [.narrowBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e40: [.narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .e41: [.narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .wideSpace, .narrowBar]
        case .e42: [.narrowBar, .wideSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar, .narrowSpace, .narrowBar]
        case .startStop: [.narrowBar, .wideSpace, .narrowBar, .narrowSpace, .wideBar, .narrowSpace, .wideBar, .narrowSpace, .narrowBar]
        }
    }

    private enum Module {
        case narrowBar, wideBar, narrowSpace, wideSpace
        var encoding: [Bool] {
            switch self {
            case .narrowBar: [true]
            case .wideBar: [true, true, true]
            case .narrowSpace: [false]
            case .wideSpace: [false, false, false]
            }
        }
    }
}
