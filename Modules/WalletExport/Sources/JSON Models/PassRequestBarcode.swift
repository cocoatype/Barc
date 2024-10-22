//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct PassRequestBarcode: Encodable {
    let format: String
    let message: String

    init(code: Code) throws {
        switch code.value {
        case .qr(let value):
            format = "qr"
            guard let message = String(data: value.payload.data, encoding: .utf8)
            else { throw PassRequestError.unrepresentableMessage }
            self.message = message
        case .code128(let value):
            format = "code128"
            let converter = Code128ValueToStringConverter()
            self.message = try converter.string(from: value)
        case .code39, .codabar, .ean:
            throw PassRequestError.unsupportedFormat
        }
    }
}
