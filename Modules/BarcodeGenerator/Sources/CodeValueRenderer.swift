//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct CodeValueRenderer: CodeRenderer {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    private var underlyingRenderer: any CodeRenderer {
        switch value {
        case .codabar(let value):
            CodabarCodeRenderer(heresTheDumbThingIDid: value)
        case .code39(let value):
            Code39CodeRenderer(value: value)
        case .code128(let value):
            Code128CodeRenderer(value: value)
        case .ean(let value):
            EANCodeRenderer(value: value)
        case .itf(let value):
            ITFCodeRenderer(value: value)
        case .pdf417(let value):
            PDF417CodeRenderer(value: value)
        case .qr(let value):
            QRCodeRenderer(value: value)
        }
    }

    func renderedCode(in containerRatio: Double) -> RenderedCode {
        underlyingRenderer.renderedCode(in: containerRatio)
    }
}
