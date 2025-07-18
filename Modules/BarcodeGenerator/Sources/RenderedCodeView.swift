//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

public struct RenderedCodeView: View {
    private let value: CodeValue
    public init(value: CodeValue) {
        self.value = value
    }

    private static let innateRatio: Double = 2

    public var body: some View {
        let renderer = CodeValueRenderer(value: value)
        let renderedCode = renderer.renderedCode(in: Self.innateRatio)
        let layout = renderer.kineNoo(in: Self.innateRatio)

        RenderedCodeShape(renderedCode: renderedCode, layout: layout)
            .fill(Color.black)
            .aspectRatio(layout.implicitRatio, contentMode: .fit)
    }

    private func renderRect(in rect: CGRect, for layout: Layout) -> CGRect {
        switch layout {
        case .linear:
            return rect
        case .ratio(let codeRatio):
            return CGRect(origin: .zero, size: CGSize(width: codeRatio, height: 1))
                .filling(rect: rect)
        }
    }
}

#Preview {
    try! RenderedCodeView(
        value: .ean(value: "444444444444")
    ).frame(width: 200, height: 100)
//    RenderedCodeView(value: .qr(value: "https://cocoatype.com", correctionLevel: .m))
}
