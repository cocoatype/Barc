//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

extension CodeValue {
    var ean: EANCodeValue? {
        return switch self {
        case .ean(let value): value
        case .code128, .code39, .codabar, .pdf417, .qr: nil
        }
    }

    var qr: QRCodeValue? {
        return switch self {
        case .qr(let value): value
        case .code128, .code39, .codabar, .pdf417, .ean: nil
        }
    }
}
