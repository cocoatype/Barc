//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Foundation

struct QRPayload: ExpressibleByStringLiteral {
    let data: Data

    init(data: Data) {
        self.data = data
    }

    init(string value: String) {
        self.init(data: value.data(using: .utf8) ?? Data())
    }

    init(stringLiteral value: String) {
        self.init(string: value)
    }
}
