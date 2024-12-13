//  Created by Geoff Pado on 12/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

struct PDF417BarcodeModel: Codable, Sendable {
    let value: [UInt16]

    init(value: [UInt16]) {
        self.value = value
    }
}
