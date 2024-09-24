//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public enum CodabarElement: Identifiable, Sendable {
    case e0, e1, e2, e3, e4, e5, e6, e7, e8, e9, dash, dollar, colon, slash, dot, plus, a, b, c, d

    public var id: UInt8 { 0 }

    var isStartStopSymbol: Bool {
        switch self {
        case .a, .b, .c, .d: true
        case .e0, .e1, .e2, .e3, .e4, .e5, .e6, .e7, .e8, .e9, .dash, .dollar, .colon, .slash, .dot, .plus: false
        }
    }
}
