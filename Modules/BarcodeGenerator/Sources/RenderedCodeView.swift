//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftUI

public struct RenderedCodeView: View {
    private let value: CodeValue
    private let errorHandler: any ErrorHandler
    public init(value: CodeValue, errorHandler: any ErrorHandler) {
        self.value = value
        self.errorHandler = errorHandler
    }

    public var body: some View {
        let renderedCode = CodeValueRenderer(value: value, errorHandler: errorHandler).renderedCode

        GeometryReader { proxy in
            let proxyRect = CGRect(origin: .zero, size: proxy.size)
            let aspectRatioRect = renderRect(in: proxyRect, for: value.kineNoo)
            let scaledCode = renderedCode.scaled(to: aspectRatioRect.size)
                .translated(to: aspectRatioRect.origin)

            Path { path in
                for i in 0..<scaledCode.rects.count {
                    path.addRect(scaledCode.rects[i])
                }
            }
            .fill(Color.black)
        }
    }

    private func renderRect(in rect: CGRect, for layout: Barcodes.Layout) -> CGRect {
        switch layout {
        case .square:
            return CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
                .fitting(rect: rect)
        case .linear:
            return rect
        }
    }
}

#Preview {
    try! RenderedCodeView(
        value: .ean(value: "444444444444"),
        errorHandler: PreviewErrorHandler()
    ).frame(width: 200, height: 100)
//    RenderedCodeView(value: .qr(value: "https://cocoatype.com", correctionLevel: .m))
}
