//  Created by Geoff Pado on 7/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcBarcodes

struct RenderedCodeShape: Shape {
    private let value: CodeValue
    public init(value: CodeValue) {
        self.value = value
    }

    nonisolated func path(in rect: CGRect) -> Path {
        let renderCache = Container.shared.renderCache()
        let renderedCode = renderCache.renderedCode(for: value, size: rect.size)
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

/*
 struct RenderedCodeShape: Shape {
     private let renderer: CodeValueRenderer
     public init(value: CodeValue) {
         self.renderer = CodeValueRenderer(value: value)
     }

     nonisolated func path(in rect: CGRect) -> Path {
         let renderedCode = self.renderedCode(in: rect.size)
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

     @State private var cachedRenderedCode: (CGSize, RenderedCode)?
     private func renderedCode(in size: CGSize) -> RenderedCode {
         print("CACHE exists? \(cachedRenderedCode != nil), checking \(size)")
         if let cachedRenderedCode, cachedRenderedCode.0 == size {
             print("CACHE hit 🟢")
             return cachedRenderedCode.1
         }

         print("CACHE miss 🔴")
         print("CACHE is caching size: \(size)")
         let renderedCode = renderer.renderedCode(in: size.width / size.height)
         cachedRenderedCode = (size, renderedCode)
         return renderedCode
     }
 }
 */

import PDF417
#Preview(traits: .fixedLayout(width: 517, height: 244)) {
    try! RenderedCodeShape(
        value: .pdf417(PDF417CodeValue(dataCodewords: CodewordsEncoder().dataCodewords(for: "1234567890123456")))
    )
}
