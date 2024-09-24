//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct PartialCode {
    var name: String = ""
    var type: BarcodeType = .ean
    var value: String = ""

    var isValid: Bool { (try? code) != nil }

    var code: Code {
        get throws {
            guard name.isEmpty == false else { throw PartialCodeValidationError.emptyName }
            return try Code(name: name, value: joMamaTree, location: nil, date: nil)
        }
    }

    enum BarcodeType: Hashable {
        case code128
        case code39
        case ean
        case qr
    }

    // joMamaTree by @nutterfi on 2023-12-04
    // the barcode model represented by the form
    private var joMamaTree: CodeValue {
        get throws {
            switch type {
            case .code128: try .code128(Code128CodeValue(payload: Code128PayloadParser().payload(for: value)))
            case .code39: try .code39(Code39CodeValue(payload: Code39PayloadParser().payload(for: value)))
            case .ean: try .ean(EANCodeValue(payload: EANPayloadParser().payload(for: value)))
            case .qr: .qr(value: value, correctionLevel: .m)
            }
        }
    }
}

enum PartialCodeValidationError: Error {
    case emptyName
}
