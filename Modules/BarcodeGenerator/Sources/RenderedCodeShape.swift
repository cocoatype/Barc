//  Created by Geoff Pado on 7/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct RenderedCodeShape: Shape {
    private let renderedCode: RenderedCode
    private let layout: Layout
    public init(renderedCode: RenderedCode, layout: Layout) {
        self.renderedCode = renderedCode
        self.layout = layout
    }

    nonisolated func path(in rect: CGRect) -> Path {
        let aspectRatioRect = switch layout {
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
