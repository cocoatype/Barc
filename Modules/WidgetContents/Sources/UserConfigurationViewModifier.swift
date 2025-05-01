//  Created by Geoff Pado on 5/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

extension WidgetConfiguration {
    func backportPromptsForViewConfiguration() -> some WidgetConfiguration {
    #if os(iOS)
    if #available(iOS 18.0, *) {
        return self.promptsForUserConfiguration()
    } else {
        return self
    }
    #else
    return self
    #endif
    }
}
