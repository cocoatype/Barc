//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import WidgetKit

struct CodeDisplayTimelineEntry: TimelineEntry {
    let code: Code = try! Code(
        name: "Cocoatype",
        value: .ean(value: "023100137698"),//.qr(value: "https://cocoatype.com", correctionLevel: .m),
        location: nil
    )
    let date: Date = Date()
}
