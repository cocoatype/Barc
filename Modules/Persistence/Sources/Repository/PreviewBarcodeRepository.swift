//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes

public struct PreviewBarcodeRepository: BarcodeRepository {
    public let barcodes = [
        BarcodeModel.qr(value: "https://cocoatype.com", correctionLevel: "M"),
        BarcodeModel.ean(value: "4444444444444"),
        BarcodeModel.qr(value: "https://iosdev.club", correctionLevel: "M"),
        BarcodeModel.qr(value: "https://blackhighlighter.app/appstore", correctionLevel: "M"),
    ]

    public func add(_ barcode: BarcodeModel) {}

    public init() {}
}
