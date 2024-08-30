//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import SwiftUI

struct WatchBarcodeView: View {
    private let code: Code
    public init(code: Code) {
        self.code = code
    }

    var body: some View {
        GeometryReader { geometry in
            let spacing = geometry.size.height - geometry.size.width
            CodeRenderer(value: code.value)
                .padding(14)
                .background { Color.white }
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(6)
                .frame(width: geometry.size.width, height: geometry.size.width)
                .offset(y: spacing / 2)
        }
        .navigationTitle(code.name)
        .ignoresSafeArea(edges: .bottom)
    }
}

import Persistence
#Preview {
    NavigationStack {
        WatchBarcodeView(code: PreviewBarcodeRepository().codes[0])
    }
}

#Preview {
    WatchBarcodeView(code: PreviewBarcodeRepository().codes[1])
}

