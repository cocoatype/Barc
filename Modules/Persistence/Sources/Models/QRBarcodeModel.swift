//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Foundation

struct QRBarcodeModel: Codable, Sendable {
    let value: Data
    let correctionLevel: String

    init(value: Data, correctionLevel: String) {
        self.value = value
        self.correctionLevel = correctionLevel
    }
}
