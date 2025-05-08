//  Created by Geoff Pado on 5/6/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import WidgetKit

import BarcBarcodes
import BarcErrorHandling
import BarcPersistence

public struct Complication: Widget {
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
            intent: ComplicationIntent.self,
            provider: ComplicationTimelineProvider(codes: codes)
        ) { entry in
            view(for: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([
            .accessoryCircular,
        ])
        .contentMarginsDisabled()
    }

    @ViewBuilder private func view(for entry: ComplicationTimelineEntry) -> some View {
        ComplicationView(codeID: entry.codeID)
    }

    private var codes: [Code] {
        do {
            return try repository.codes
        } catch {
            errorHandler.log(error, module: "WatchWidgets", type: "Complication")
            return []
        }
    }
}

#if DEBUG
let previewQRCode = Code(
    name: "Website",
    value: ComplicationTimelineEntry.qrCodeValue,
    location: nil,
    date: nil
)
@MainActor let previewWidget = Complication(
    repository: PreviewBarcodeRepository(),
    errorHandler: PreviewErrorHandler()
)
@MainActor let previewTimelineProvider = ComplicationTimelineProvider(codes: PreviewBarcodeRepository.sampleCodes)

#Preview(
    "QR Circular",
    as: .accessoryCircular,
    using: ComplicationIntent(code: previewQRCode),
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
)
#Preview(
    "QR Rectangular",
    as: .accessoryRectangular,
    using: ComplicationIntent(code: previewQRCode),
    widget: { previewWidget },
    timelineProvider: { previewTimelineProvider }
)
#endif
