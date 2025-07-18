//  Created by Geoff Pado on 7/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

public struct CodeValueMeasurer {
    private let underlyingRenderer: CodeValueRenderer
    public init(value: CodeValue) {
        underlyingRenderer = CodeValueRenderer(value: value)
    }

    public func ratio(in containerRatio: Double) -> Double {
        underlyingRenderer.kineNoo(in: containerRatio).implicitRatio
    }
}
