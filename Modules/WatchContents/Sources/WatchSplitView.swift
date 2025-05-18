//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct WatchSplitView: View {
    @Binding private var selectedCode: Code?
    private let codes: [Code]

    init(codes: [Code], selectedCode: Binding<Code?>) {
        self.codes = codes
        _selectedCode = selectedCode
    }

    var body: some View {
        NavigationSplitView {
            WatchLibraryView(
                codes: codes,
                selection: $selectedCode
            )
        } detail: {
            if let selectedCode {
                WatchBarcodeView(code: selectedCode)
            }
        }
    }
}
