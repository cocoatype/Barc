//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import OSLog
import WidgetKit

import BarcBarcodes
import BarcErrorHandling
import BarcShortcutsModels
import BarcWidgetShortcuts

struct CodeDisplayTimelineProvider: AppIntentTimelineProvider {
    let codes: [Code]
    func recommendations() -> [AppIntentRecommendation<BarcWidgetShortcuts.CodeDisplayConfigurationIntent>] {
        os_log("returning recommendations for %{public}d codes", codes.count)
        return codes.map { code in
            os_log("returning recommendation for %{public}@", String(describing: code))
            let intent = CodeDisplayConfigurationIntent()
            intent.code = BarcodeEntity(code: code, errorHandler: ErrorHandling.defaultHandler)
            os_log("recommendation intent is %{public}@", String(describing: intent.code))
            return AppIntentRecommendation(intent: intent, description: code.name)
        }
    }

    typealias Intent = CodeDisplayConfigurationIntent

    func placeholder(in context: Context) -> CodeDisplayTimelineEntry {
        os_log("returning placeholder for some reason")
        let placeholderCode = Code(
            name: "Placeholder",
            value: .qr(value: "https://cocoatype.com", correctionLevel: .m),
            location: nil,
            date: nil
        )
        return CodeDisplayTimelineEntry(code: placeholderCode)
    }

    func snapshot(for configuration: CodeDisplayConfigurationIntent, in context: Context) async -> CodeDisplayTimelineEntry {
        let codeName = "\(configuration.code?.name ?? "(null)")"
        os_log("returning snapshot for %{public}@", codeName)
        return CodeDisplayTimelineEntry(code: configuration.code?.code)
    }

    func timeline(for configuration: CodeDisplayConfigurationIntent, in context: Context) async -> Timeline<CodeDisplayTimelineEntry> {
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        let entry = CodeDisplayTimelineEntry(code: configuration.code?.code)
        let codeName = "\(configuration.code?.name ?? "(null)")"
        os_log("returning timeline for %{public}@", codeName)
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
        return timeline
    }
}
