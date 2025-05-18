//  Created by Geoff Pado on 5/6/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import AppIntents

import BarcBarcodes

public struct ComplicationIntent: WidgetConfigurationIntent {
    public static let title: LocalizedStringResource = "DisplayCodeIntent.title"
    public static let description: IntentDescription = "DisplayCodeIntent.description"

    public init() {}

    public init(code: Code) {
        self.codeID = code.id
    }

    @Parameter(
        title: "DisplayCodeIntent.code.title",
        default: ""
    )
    public var codeID: String
}
