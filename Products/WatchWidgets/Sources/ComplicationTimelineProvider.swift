//  Created by Geoff Pado on 5/6/24.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import OSLog
import WidgetKit

import BarcBarcodes

struct ComplicationTimelineProvider: AppIntentTimelineProvider {
    let codes: [Code]
    func recommendations() -> [AppIntentRecommendation<ComplicationIntent>] {
        return codes.map { code in
            let intent = ComplicationIntent(code: code)
            return AppIntentRecommendation(intent: intent, description: code.name)
        }
    }

    func placeholder(in context: Context) -> ComplicationTimelineEntry {
        os_log("BARC! Returning placeholder!")
        return ComplicationTimelineEntry(codeID: "X-Cocoatype-Placeholder")
    }

    func snapshot(for configuration: ComplicationIntent, in context: Context) async -> ComplicationTimelineEntry {
        os_log("BARC! Returning snapshot for %{public}@!", configuration.codeID)
        return ComplicationTimelineEntry(codeID: configuration.codeID)
    }

    func timeline(for configuration: ComplicationIntent, in context: Context) async -> Timeline<ComplicationTimelineEntry> {
        os_log("BARC! Returning timeline entries for %{public}@!", configuration.codeID)
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 30, to: .now)!
        let entry = ComplicationTimelineEntry(codeID: configuration.codeID)
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
        return timeline
    }
}
