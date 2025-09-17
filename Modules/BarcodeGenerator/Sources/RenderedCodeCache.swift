//  Created by Geoff Pado on 9/9/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import CoreGraphics

import FactoryKit

import BarcBarcodes

class RenderedCodeCache {
    private var cache = [CodeValue: CachedCode]()
    func renderedCode(for value: CodeValue, size: CGSize) -> RenderedCode {
        if let cachedCode = cache[value], size == cachedCode.size {
            return cachedCode.renderedCode
        } else {
            let renderer = CodeValueRenderer(value: value)
            let renderedCode = renderer.renderedCode(in: size.width / size.height)
            cache[value] = CachedCode(size: size, renderedCode: renderedCode)
            return renderedCode
        }
    }

    struct CachedCode {
        let size: CGSize
        let renderedCode: RenderedCode
    }
}

extension Container {
    var renderCache: Factory<RenderedCodeCache> {
        Factory(self) {
            RenderedCodeCache()
        }.singleton
    }
}
