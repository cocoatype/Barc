//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling

struct CodeValueRenderer: CodeRenderer {
    let value: CodeValue
    let errorHandler: any ErrorHandler

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
        case .pdf417(let value):
            PDF417CodeRenderer(value: value, errorHandler: errorHandler).renderedCode
        case .qr(let value):
            QRCodeRenderer(value: value, errorHandler: errorHandler).renderedCode
        }
    }
}
