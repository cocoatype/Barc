//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

enum BarcodeModelType: Codable, Sendable {
    case codabar(CodabarBarcodeModel)
    case code39(Code39BarcodeModel)
    case code128(Code128BarcodeModel)
    case ean(EANBarcodeModel)
    case pdf417(PDF417BarcodeModel)
    case qr(QRBarcodeModel)
}
