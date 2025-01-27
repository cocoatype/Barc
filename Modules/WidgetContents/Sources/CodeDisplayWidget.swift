//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI
import WidgetKit
import WidgetShortcuts

public struct CodeDisplayWidget: Widget {
    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    init(
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.repository = repository
        self.errorHandler = errorHandler
    }

    public init() {
        self.init(
            repository: Persistence.guardLetNotIsScrollingDoesNotEqual,
            errorHandler: ErrorHandling.defaultHandler
        )
    }

    public var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: "com.cocoatype.Barc.Widgets.CodeDisplayWidget",
            intent: CodeDisplayConfigurationIntent.self,
            provider: CodeDisplayTimelineProvider(codes: codes)) { entry in
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
#if os(iOS)
            .supportedFamilies([
                .systemSmall,
                .systemMedium,
                .systemLarge,
                .systemExtraLarge,
                .accessoryCircular,
            ])
#elseif os(watchOS)
            .supportedFamilies([
                .accessoryCircular,
            ])
#endif
            .contentMarginsDisabled()
    }

    private var codes: [Code] {
        do {
            return try repository.codes
        } catch {
            errorHandler.log(error, module: "WidgetContents", type: "CodeDisplayWidget")
            return []
        }
    }
}

#if DEBUG
let previewQRCode = Code(
    name: "Website",
    value: CodeDisplayTimelineEntry.qrCodeValue,
    location: nil,
    date: nil
)
@MainActor let previewWidget = CodeDisplayWidget(
    repository: PreviewBarcodeRepository(),
    errorHandler: PreviewErrorHandler()
)
@MainActor let previewTimelineProvider = CodeDisplayTimelineProvider(codes: PreviewBarcodeRepository.sampleCodes)

#if os(iOS)
#Preview(
    "QR Small",
    as: .systemSmall,
    using: CodeDisplayConfigurationIntent(code: previewQRCode),
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
)

#Preview(
    "QR Medium",
    as: .systemMedium,
    using: CodeDisplayConfigurationIntent(code: previewQRCode),
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
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
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
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
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
)

#Preview(
    "Empty Selection",
    as: .systemSmall,
    using: CodeDisplayConfigurationIntent(),
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
)
#elseif os(watchOS)
#Preview(
    "QR Circular",
    as: .accessoryCircular,
    using: CodeDisplayConfigurationIntent(code: previewQRCode),
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
)
#Preview(
    "QR Rectangular",
    as: .accessoryRectangular,
    using: CodeDisplayConfigurationIntent(code: previewQRCode),
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
)

#endif
#endif
