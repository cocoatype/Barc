//  Created by Geoff Pado on 8/29/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI

struct WatchLibraryView: View {
    @Binding private var selection: Code?
    private let codes: [Code]
    private let errorHandler: any ErrorHandler
    init(codes: [Code], selection: Binding<Code?>, errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.codes = codes
        self.errorHandler = errorHandler
        _selection = selection
    }

    var body: some View {
        List(codes, selection: $selection) { code in
            WatchLibraryCell(code: code)
                .tag(code)
        }
    }
}

#Preview {
    WatchLibraryView(codes: PreviewBarcodeRepository().codes, selection: .constant(PreviewBarcodeRepository().codes[0]))
}
