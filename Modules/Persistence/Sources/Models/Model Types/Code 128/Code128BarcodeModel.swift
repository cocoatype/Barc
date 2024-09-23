//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

struct Code128BarcodeModel: Codable, Sendable {
    let value: Data

    init(value: Data) {
        self.value = value
    }
}
