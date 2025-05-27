//  Created by Geoff Pado on 5/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct LargeBarcode: View {
    static let width = 280.0
    static let padding = 14.0

    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    var body: some View {
        HDRLargeBarcode(value: value)
    }
}
