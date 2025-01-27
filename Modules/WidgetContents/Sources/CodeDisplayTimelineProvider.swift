//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import WidgetShortcuts
import WidgetKit

struct CodeDisplayTimelineProvider: AppIntentTimelineProvider {
    let codes: [Code]
    func recommendations() -> [AppIntentRecommendation<WidgetShortcuts.CodeDisplayConfigurationIntent>] {
        codes.map { code in
            AppIntentRecommendation(intent: CodeDisplayConfigurationIntent(code: code), description: code.name)
        }
    }

    typealias Intent = CodeDisplayConfigurationIntent

    func placeholder(in context: Context) -> CodeDisplayTimelineEntry {
        let placeholderCode = Code(
            name: "Cocoatype",
            value: .qr(value: "https://cocoatype.com", correctionLevel: .m),
            location: nil,
            date: nil
        )
        return CodeDisplayTimelineEntry(code: placeholderCode)
    }

    func snapshot(for configuration: CodeDisplayConfigurationIntent, in context: Context) async -> CodeDisplayTimelineEntry {
        return CodeDisplayTimelineEntry(code: configuration.code?.code)
    }

    func timeline(for configuration: CodeDisplayConfigurationIntent, in context: Context) async -> Timeline<CodeDisplayTimelineEntry> {
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        let entry = CodeDisplayTimelineEntry(code: configuration.code?.code)
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
        return timeline
    }
}
