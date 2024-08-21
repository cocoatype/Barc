//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import WidgetKit

struct CodeDisplayTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> CodeDisplayTimelineEntry {
        .init()
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (CodeDisplayTimelineEntry) -> Void) {
        completion(.init())
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<CodeDisplayTimelineEntry>) -> Void) {
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        let timeline = Timeline(entries: [CodeDisplayTimelineEntry()], policy: .after(nextUpdateDate))
        completion(timeline)
    }
}
