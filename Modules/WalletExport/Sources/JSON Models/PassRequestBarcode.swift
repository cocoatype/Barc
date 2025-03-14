//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes
import Foundation
import PDF417

struct PassRequestBarcode: Encodable {
    let format: String
    let message: String

    private init(format: String, message: String) {
        self.format = format
        self.message = message
    }

    init(code: Code) throws {
        switch code.value {
        case .codabar(let value):
            let converter = CodabarElementToCharacterConverter()
            let characters = value.payload.elements.map(converter.character(for:))
            self.init(format: "codabar", message: String(characters))
        case .code39(let value):
            let converter = Code39ElementToCharacterConverter()
            let characters = value.payload.elements.map(converter.character(for:))
            self.init(format: "code39", message: String(characters))
        case .code128(let value):
            let converter = Code128ValueToStringConverter()
            try self.init(format: "code128", message: converter.string(from: value))
        case .ean(let value):
            let converter = EANDigitToCharacterConverter()
            let characters = value.payload.digits.map(converter.character(for:))
            self.init(format: "ean13", message: String(characters))
        case .pdf417(let value):
            let codewordConverter = CodewordToIntConverter()
            let bytes = value.dataCodewords
                .map(codewordConverter.value(for:))
                .map(UInt16.init)
                .map(\.bigEndian)
                .flatMap { [UInt8($0 >> 8), UInt8($0 & 0xFF)] }
            self.init(format: "pdf417", message: Data(bytes).base64EncodedString())
        case .qr(let value):
            guard let message = String(data: value.payload.data, encoding: .utf8)
            else { throw PassRequestError.unrepresentableMessage }
            self.init(format: "qr", message: message)
        }
    }
}
