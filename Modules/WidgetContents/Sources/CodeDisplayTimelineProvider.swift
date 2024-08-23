//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Shortcuts
import WidgetKit

struct CodeDisplayTimelineProvider: AppIntentTimelineProvider {
    typealias Intent = CodeDisplayConfigurationIntent
    private static let sampleCode = Code(name: "Cocoatype", value: CodeDisplayTimelineEntry.qrCodeValue, location: nil)

    func placeholder(in context: Context) -> CodeDisplayTimelineEntry {
        CodeDisplayTimelineEntry(code: Self.sampleCode)
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
