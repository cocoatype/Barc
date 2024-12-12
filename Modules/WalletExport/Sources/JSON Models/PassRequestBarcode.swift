//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct PassRequestBarcode: Encodable {
    let format: String
    let message: String

    init(code: Code) throws {
        switch code.value {
        case .codabar(let value):
            format = "codabar"
            let converter = CodabarElementToCharacterConverter()
            let characters = value.payload.elements.map(converter.character(for:))
            self.message = String(characters)
        case .code39(let value):
            format = "code39"
            let converter = Code39ElementToCharacterConverter()
            let characters = value.payload.elements.map(converter.character(for:))
            self.message = String(characters)
        case .code128(let value):
            format = "code128"
            let converter = Code128ValueToStringConverter()
            self.message = try converter.string(from: value)
        case .ean(let value):
            format = "ean13"
            let converter = EANDigitToCharacterConverter()
            let characters = value.payload.digits.map(converter.character(for:))
            self.message = String(characters)
        case .pdf417(let value):
            #warning("FIX ME!!!")
            fatalError()
        case .qr(let value):
            format = "qr"
            guard let message = String(data: value.payload.data, encoding: .utf8)
            else { throw PassRequestError.unrepresentableMessage }
            self.message = message
        }
    }
}
