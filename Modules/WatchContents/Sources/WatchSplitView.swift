//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftUI

struct WatchSplitView: View {
    @State private var selectedCode: Code?
    private let codes: [Code]
    private let errorHandler: any ErrorHandler

    init(codes: [Code], errorHandler: any ErrorHandler) {
        self.codes = codes
        self.errorHandler = errorHandler

        if let selectedCode = codes.first {
            self.selectedCode = selectedCode
        } else {
            self.selectedCode = nil
            errorHandler.log(WatchSplitViewError.noSelectedCode, module: "WatchContents", type: "WatchSplitView")
        }
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
