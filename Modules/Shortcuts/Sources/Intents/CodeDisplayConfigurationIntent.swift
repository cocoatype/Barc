//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes

public struct CodeDisplayConfigurationIntent: WidgetConfigurationIntent {
    public static let title: LocalizedStringResource = "DisplayCodeIntent.title"
    public static let description: IntentDescription = "DisplayCodeIntent.description"

    public init() {}

    public init(code: Code) {
        self.code = BarcodeEntity(code: code)
    }

    @Parameter(
        title: "DisplayCodeIntent.code.title"
    )
    public var code: BarcodeEntity?
}
