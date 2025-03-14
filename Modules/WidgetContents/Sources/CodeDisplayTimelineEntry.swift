//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import WidgetKit

import BarcBarcodes

struct CodeDisplayTimelineEntry: TimelineEntry {
    static let eanCodeValue = try! CodeValue.ean(value: "444444444444")
    static let qrCodeValue = CodeValue.qr(value: "https://cocoatype.com", correctionLevel: .m)

    let code: Code?
    let date: Date = Date()
}
