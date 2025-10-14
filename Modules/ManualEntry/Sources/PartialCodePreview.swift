//  Created by Geoff Pado on 10/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodeGenerator
import BarcBarcodes

struct PartialCodePreview: View {
    private let partialCode: PartialCode
    init(partialCode: PartialCode) {
        self.partialCode = partialCode
    }

    var body: some View {
        HStack {
            Spacer()
            codeView
                .frame(width: 140, height: 140)
                .padding(14)
                .background(CodeBackground())
            Spacer()
        }
    }

    @State private var animationRunning = false
    @ViewBuilder
    private var codeView: some View {
        if let value = try? partialCode.code.value {
            RenderedCodeView(value: value)
        } else {
            Image(systemName: "ellipsis")
                .symbolEffect(.variableColor, options: .repeat(.max), value: animationRunning)
                .imageScale(.large)
                .fontWeight(.black)
                .foregroundStyle(.secondary)
                .onAppear {
                    animationRunning = true
                }
        }
    }
}

#Preview {
    VStack {
        PartialCodePreview(
            partialCode: PartialCode(
                name: "Go To My Store",
                type: .qr,
                value: "https://cocoatype.com",
            )
        )
        PartialCodePreview(
            partialCode: PartialCode(
                name: "Go To My Store",
                type: .ean,
                value: "https://cocoatype.com",
            )
        )
    }
}

