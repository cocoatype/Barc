//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftUI

struct WatchSplitView: View {
    @State private var selectedCode: Code?
    private let codes: [Code]

    init(codes: [Code], errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.codes = codes

        if let selectedCode = codes.first {
            self.selectedCode = selectedCode
        } else {
            self.selectedCode = nil
            errorHandler.log(WatchSplitViewError.noSelectedCode, module: "WatchContents", type: "WatchSplitView")
        }
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

enum WatchSplitViewError: Error {
    case noSelectedCode
}
