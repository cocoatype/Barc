//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

struct Code39BarcodeModel: Codable, Sendable {
    let value: String

    init(value: String) {
        self.value = value
    }
}
