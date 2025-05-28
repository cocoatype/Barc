//  Created by Geoff Pado on 5/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct LargeBarcode: View {
    static let width = 280.0
    static let padding = 14.0

    private let value: CodeValue
    private let isHighBrightnessOn: Bool
    init(value: CodeValue, isHighBrightnessOn: Bool) {
        self.value = value
        self.isHighBrightnessOn = isHighBrightnessOn
    }

    @State private var cachedBrightness: Double?
    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        if isHighBrightnessOn {
            HDRLargeBarcode(value: value)
        } else {
            SDRLargeBarcode(value: value)
        }
    }
}
