//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import WidgetKit

struct CodeDisplayTimelineEntry: TimelineEntry {
    static let eanCodeValue = try! CodeValue.ean(value: "023100137698")
    static let qrCodeValue = CodeValue.qr(value: "https://cocoatype.com", correctionLevel: .m)

    let code: Code?
    let date: Date = Date()
}
