//  Created by Geoff Pado on 5/6/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import WidgetKit

import BarcBarcodes

struct ComplicationTimelineEntry: TimelineEntry {
    static let eanCodeValue = try! CodeValue.ean(value: "444444444444")
    static let qrCodeValue = CodeValue.qr(value: "https://cocoatype.com", correctionLevel: .m)

    let codeID: String
    let date: Date = Date()
}
