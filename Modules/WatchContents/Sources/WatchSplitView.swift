//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct WatchSplitView: View {
    @State private var selectedCode: Code?
    private let codes: [Code]

    init(codes: [Code]) {
        self.codes = codes
        self.selectedCode = codes.first
    }

    var body: some View {
        NavigationSplitView {
            WatchLibraryView(codes: codes, selection: $selectedCode)
        } detail: {
            if let selectedCode {
                WatchBarcodeView(code: selectedCode)
            }
        }
    }
}
