//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

extension BarcodeModel {
    var ean: EANBarcodeModel? {
        return switch type {
        case .ean(let model): model
        case .qr: nil
        }
    }

    var qr: QRBarcodeModel? {
        return switch type {
        case .ean: nil
        case .qr(let model): model
        }
    }
}
