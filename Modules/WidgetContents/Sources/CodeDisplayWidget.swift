//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Shortcuts
import SwiftUI
import WidgetKit

public struct CodeDisplayWidget: Widget {
    public init() {}

    public var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: "com.cocoatype.Barc.Widgets.CodeDisplayWidget",
            intent: CodeDisplayConfigurationIntent.self,
            provider: CodeDisplayTimelineProvider()) { entry in
                Group {
                    if let code = entry.code {
                        CodeDisplayView(code: code)
                    } else {
                        Color.red
                    }
                }
                .containerBackground(for: .widget) {
                    Color.cellBackground
                }
            }
            .contentMarginsDisabled()
    }
}

#Preview(
    as: .systemMedium,
    using: CodeDisplayConfigurationIntent(
        code: Code(
            name: "Website",
            value: CodeDisplayTimelineEntry.eanCodeValue,
            location: nil
        )
    ),
    widget: {
        CodeDisplayWidget()
    },
    timelineProvider: {
        CodeDisplayTimelineProvider()
    }
)

#Preview(
    as: .systemMedium,
    using: CodeDisplayConfigurationIntent(),
    widget: {
        CodeDisplayWidget()
    },
    timelineProvider: {
        CodeDisplayTimelineProvider()
    }
)
