//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

enum BarcodeModelType: Codable, Sendable {
    case code128(Code128BarcodeModel)
    case code39(Code39BarcodeModel)
    case codabar(CodabarBarcodeModel)
    case ean(EANBarcodeModel)
    case qr(QRBarcodeModel)
}
