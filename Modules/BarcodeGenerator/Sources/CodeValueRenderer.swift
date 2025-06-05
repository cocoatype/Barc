//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct CodeValueRenderer: CodeRenderer {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    var renderedCode: RenderedCode {
        switch value {
        case .codabar(let value):
            CodabarCodeRenderer(heresTheDumbThingIDid: value).renderedCode
        case .code39(let value):
            Code39CodeRenderer(value: value).renderedCode
        case .code128(let value):
            Code128CodeRenderer(value: value).renderedCode
        case .ean(let value):
            EANCodeRenderer(value: value).renderedCode
        case .itf(let value):
            ITFCodeRenderer(value: value).renderedCode
        case .pdf417(let value):
            PDF417CodeRenderer(value: value).renderedCode
        case .qr(let value):
            QRCodeRenderer(value: value).renderedCode
        }
    }
}
