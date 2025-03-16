//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum WatchSplitViewError: Error, CustomLocalizedStringResourceConvertible {
    case noSelectedCode

    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .noSelectedCode: StringResources.WatchSplitViewError.noSelectedCode
        }
    }
}
