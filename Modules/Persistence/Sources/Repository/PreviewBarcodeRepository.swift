//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes

public struct PreviewBarcodeRepository: BarcodeRepository {
    public let barcodes = [
        BarcodeModel.qr(value: "49163140367", correctionLevel: "M"),
        BarcodeModel.ean(value: "4444444444444"),
        BarcodeModel.qr(value: "49163140367", correctionLevel: "M"),
        BarcodeModel.qr(value: "49163140367", correctionLevel: "M"),
    ]

    public func add(_ barcode: BarcodeModel) {}

    public init() {}
}
