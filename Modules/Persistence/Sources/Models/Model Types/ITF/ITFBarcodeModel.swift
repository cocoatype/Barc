//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

struct ITFBarcodeModel: Codable, Sendable {
    let value: String
    init(value: String) {
        self.value = value
    }
}
