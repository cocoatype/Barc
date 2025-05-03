//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import OSLog
import SwiftUI
import WidgetKit

import BarcBarcodes
import BarcErrorHandling
import BarcPersistence
import BarcWidgetShortcuts

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
            provider: CodeDisplayTimelineProvider(codes: codes)
        ) { entry in
            let _ = os_log("returning view for %{public}@", String(describing: entry.code?.name))
            view(for: entry)
                .containerBackground(for: .widget) {
                    Color.cellBackground
                }
        }
        .backportPromptsForViewConfiguration()
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

    @ViewBuilder private func view(for entry: CodeDisplayTimelineEntry) -> some View {
        if let code = entry.code {
            let _ = os_log("returning code display view for %{public}@", code.name)
            CodeDisplayView(code: code, errorHandler: errorHandler)
        } else {
            let _ = os_log("returning missing code display view for %{public}@", String(describing: entry))
            CodeMissingView()
        }
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
//#Preview(
//    "QR Circular",
//    as: .accessoryCircular,
//    using: CodeDisplayConfigurationIntent(code: previewQRCode),
//    widget: { previewWidget },
//    timelineProvider: { previewTimelineProvider }
//)
//#Preview(
//    "QR Rectangular",
//    as: .accessoryRectangular,
//    using: CodeDisplayConfigurationIntent(code: previewQRCode),
//    widget: { previewWidget },
//    timelineProvider: { previewTimelineProvider }
//)

#endif
#endif
