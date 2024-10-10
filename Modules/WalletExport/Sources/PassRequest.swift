//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation

struct PassRequest: Encodable {
    let title: String
    let barcode: Barcode

    init(code: Code) throws {
        self.title = code.name
        self.barcode = try Barcode(code: code)
    }

    struct Barcode: Encodable {
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
}

enum PassRequestError: Error {
    case unrepresentableMessage
    case unsupportedFormat
}
