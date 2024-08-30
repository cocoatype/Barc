//  Created by Geoff Pado on 8/29/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import SwiftUI

public struct WatchLibraryView: View {
    private let value: CodeValue
    public init(value: CodeValue) {
        self.value = value
    }

    public var body: some View {
        CodeRenderer(value: value)
            .ignoresSafeArea(edges: ignoredEdges)
            .padding(.horizontal, 20)
            .background(.white)
            .overlay(WatchTimeScrim())
    }

    private var ignoredEdges: Edge.Set {
        switch value {
        case .qr: []
        case .ean: .bottom
        }
    }
}

#Preview {
    WatchLibraryView(value: .qr(value: "https://cocoatype.com", correctionLevel: .m))
}

#Preview {
    try! WatchLibraryView(value: .ean(value: "4444444444444"))
}
