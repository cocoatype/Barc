//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import WidgetKit

import FactoryKit

import BarcBarcodes
import BarcErrorHandling
import BarcPersistence
import BarcWidgetShortcuts

public struct CodeDisplayWidget: Widget {
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    @Injected(\.errorHandler) private var errorHandler

    public init() {}

    public var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: "com.cocoatype.Barc.Widgets.CodeDisplayWidget",
            intent: CodeDisplayConfigurationIntent.self,
            provider: CodeDisplayTimelineProvider(codes: codes)
        ) { entry in
            view(for: entry)
                .containerBackground(for: .widget) {
                    Color.cellBackground
                }
        }
        .backportPromptsForViewConfiguration()
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge,
            .systemExtraLarge,
            .accessoryCircular,
        ])
        .contentMarginsDisabled()
    }

    @ViewBuilder private func view(for entry: CodeDisplayTimelineEntry) -> some View {
        if let code = entry.code {
            CodeDisplayView(code: code)
        } else {
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
@MainActor let previewWidget = CodeDisplayWidget()
@MainActor let previewTimelineProvider = CodeDisplayTimelineProvider(codes: PreviewBarcodeRepository.sampleCodes)

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
#endif
