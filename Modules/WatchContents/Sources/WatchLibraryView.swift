//  Created by Geoff Pado on 8/29/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcPersistence

struct WatchLibraryView: View {
    @Binding private var selection: Code?
    private let codes: [Code]
    init(
        codes: [Code],
        selection: Binding<Code?>
    ) {
        self.codes = codes
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
    WatchLibraryView(
        codes: PreviewBarcodeRepository.sampleCodes,
        selection: .constant(PreviewBarcodeRepository.sampleCodes[0])
    )
}
