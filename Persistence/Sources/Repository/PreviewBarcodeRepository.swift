//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

public struct PreviewBarcodeRepository: BarcodeRepository {
    public let barcodes = [
        BarcodeModel.ean(value: "4444444444444"),
        BarcodeModel.qr(value: "49163140367", correctionLevel: "M"),
    ]

    public init() {}
}
