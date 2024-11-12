//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public struct RenderedCodeView: View {
    private let value: CodeValue
    public init(value: CodeValue) {
        self.value = value
    }

    public var body: some View {
        let renderedCode = CodeValueRenderer(value: value).renderedCode

        GeometryReader { proxy in
            let aspectRatio = value.kineNoo
            let aspectRatioSize = CGRect(origin: .zero, size: CGSize(width: 1, height: aspectRatio)).fitting(rect: CGRect(origin: .zero, size: proxy.size)).size
            let scaledCode = renderedCode.scaled(to: aspectRatioSize)
            Path { path in
                for i in 0..<scaledCode.rects.count {
                    path.addRect(scaledCode.rects[i])
                }
            }
            .fill(Color.black)
        }
    }
}

#Preview {
    try! RenderedCodeView(value: .ean(value: "444444444444"))
//    RenderedCodeView(value: .qr(value: "https://cocoatype.com", correctionLevel: .m))
}
