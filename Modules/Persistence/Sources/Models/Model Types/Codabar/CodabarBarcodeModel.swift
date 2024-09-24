//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

struct CodabarBarcodeModel: Codable, Sendable {
    let value: String

    init(value: String) {
        self.value = value
    }
}
