//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftUI

struct WatchSplitView: View {
    @Binding private var selectedCode: Code?
    private let codes: [Code]
    private let errorHandler: any ErrorHandler

    init(codes: [Code], selectedCode: Binding<Code?>, errorHandler: any ErrorHandler) {
        self.codes = codes
        self.errorHandler = errorHandler

        _selectedCode = selectedCode
    }

    var body: some View {
        NavigationSplitView {
            WatchLibraryView(
                codes: codes,
                selection: $selectedCode,
                errorHandler: errorHandler
            )
        } detail: {
            if let selectedCode {
                WatchBarcodeView(code: selectedCode, errorHandler: errorHandler)
            }
        }
    }
}
