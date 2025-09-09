//  Created by Geoff Pado on 7/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct RenderedCodeShape: Shape {
    private let value: CodeValue
    public init(value: CodeValue) {
        self.value = value
    }

    nonisolated func path(in rect: CGRect) -> Path {
        let renderer = CodeValueRenderer(value: value)
        let renderedCode = renderer.renderedCode(in: rect.width / rect.height)
        let aspectRatioRect = switch renderedCode.kineNoo {
        case .linear:
            rect
        case .ratio(let codeRatio):
            CGRect(origin: .zero, size: CGSize(width: codeRatio, height: 1))
                .fitting(rect: rect)
        }

        let scaledCode = renderedCode
            .scaled(to: aspectRatioRect.size)
            .translated(to: aspectRatioRect.origin)

        return Path { path in
            for i in 0..<scaledCode.rects.count {
                path.addRect(scaledCode.rects[i])
            }
        }
    }
}

import PDF417
#Preview(traits: .fixedLayout(width: 517, height: 180)) {
    try! RenderedCodeShape(
        value: .pdf417(PDF417CodeValue(dataCodewords: CodewordsEncoder().dataCodewords(for: "1234567890123456")))
    )
}
