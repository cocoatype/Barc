//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import WidgetKit

public struct CodeDisplayWidget: Widget {
    public init() {}
    
    public var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.cocoatype.Barc.Widgets.CodeDisplayWidget",
            provider: CodeDisplayTimelineProvider()) { entry in
                CodeDisplayView(code: entry.code)
                    .containerBackground(for: .widget) {
                        Color.white
                    }
            }
            .contentMarginsDisabled()
    }
}

#Preview(as: .systemSmall, widget: {
    CodeDisplayWidget()
}, timelineProvider: {
    CodeDisplayTimelineProvider()
})
