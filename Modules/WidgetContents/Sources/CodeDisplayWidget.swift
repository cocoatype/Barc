//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Shortcuts
import SwiftUI
import WidgetKit

public struct CodeDisplayWidget: Widget {
    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    public init() {
        self.init(errorHandler: ErrorHandling.defaultHandler)
    }

    public var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: "com.cocoatype.Barc.Widgets.CodeDisplayWidget",
            intent: CodeDisplayConfigurationIntent.self,
            provider: CodeDisplayTimelineProvider()) { entry in
                Group {
                    if let code = entry.code {
                        CodeDisplayView(code: code, errorHandler: errorHandler)
                    } else {
                        CodeMissingView()
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
    "QR Small",
    as: .systemSmall,
    using: CodeDisplayConfigurationIntent(
        code: Code(
            name: "Website",
            value: CodeDisplayTimelineEntry.qrCodeValue,
            location: nil,
            date: nil
        )
    ),
    widget: {
        CodeDisplayWidget(errorHandler: PreviewErrorHandler())
    },
    timelineProvider: {
        CodeDisplayTimelineProvider()
    }
)

#Preview(
    "QR Medium",
    as: .systemMedium,
    using: CodeDisplayConfigurationIntent(
        code: Code(
            name: "Website",
            value: CodeDisplayTimelineEntry.qrCodeValue,
            location: nil,
            date: nil
        )
    ),
    widget: {
        CodeDisplayWidget(errorHandler: PreviewErrorHandler())
    },
    timelineProvider: {
        CodeDisplayTimelineProvider()
    }
)

#Preview(
    "EAN Small",
    as: .systemSmall,
    using: CodeDisplayConfigurationIntent(
        code: Code(
            name: "EAN",
            value: CodeDisplayTimelineEntry.eanCodeValue,
            location: nil,
            date: nil
        )
    ),
    widget: {
        CodeDisplayWidget(errorHandler: PreviewErrorHandler())
    },
    timelineProvider: {
        CodeDisplayTimelineProvider()
    }
)

#Preview(
    "EAN Medium",
    as: .systemMedium,
    using: CodeDisplayConfigurationIntent(
        code: Code(
            name: "EAN",
            value: CodeDisplayTimelineEntry.eanCodeValue,
            location: nil,
            date: nil
        )
    ),
    widget: {
        CodeDisplayWidget(errorHandler: PreviewErrorHandler())
    },
    timelineProvider: {
        CodeDisplayTimelineProvider()
    }
)

#Preview(
    "Empty Selection",
    as: .systemSmall,
    using: CodeDisplayConfigurationIntent(),
    widget: {
        CodeDisplayWidget(errorHandler: PreviewErrorHandler())
    },
    timelineProvider: {
        CodeDisplayTimelineProvider()
    }
)
