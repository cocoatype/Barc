//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

public enum BarcodeModelType: Codable, Sendable {
    case ean(EANBarcodeModel)
    case qr(QRBarcodeModel)
}
