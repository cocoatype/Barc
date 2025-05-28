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

    @ViewBuilder private var barcodeView: some View {
        HDRLargeBarcode(value: value)
    }

    @State private var cachedBrightness: Double?
    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        barcodeView
            .onAppear { toggleBrightness(true) }
            .onDisappear { toggleBrightness(false) }
    }

    private func toggleBrightness(_ isBright: Bool) {
        if isBright {
            cachedBrightness = UIScreen.main.brightness
            UIScreen.main.brightness = 1.0
        } else if let cachedBrightness {
            UIScreen.main.brightness = cachedBrightness
        }
    }
}
