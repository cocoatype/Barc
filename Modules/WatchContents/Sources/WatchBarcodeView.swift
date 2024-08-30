//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import SwiftUI

struct WatchBarcodeView: View {
    private let value: CodeValue
    public init(value: CodeValue) {
        self.value = value
    }

    var body: some View {
        GeometryReader { geometry in
            let spacing = geometry.size.height - geometry.size.width
            CodeRenderer(value: value)
                .padding(14)
                .background { Color.white }
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(6)
                .frame(width: geometry.size.width, height: geometry.size.width)
                .offset(y: spacing / 2)
        }
        .ignoresSafeArea()
    }

    private var ignoredEdges: Edge.Set {
        switch value {
        case .qr: []
        case .ean: .bottom
        }
    }
}

#Preview {
    WatchBarcodeView(value: .qr(value: "https://cocoatype.com", correctionLevel: .m))
}

#Preview {
    try! WatchBarcodeView(value: .ean(value: "4444444444444"))
}

