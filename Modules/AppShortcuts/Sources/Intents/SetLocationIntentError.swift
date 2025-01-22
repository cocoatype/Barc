//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum SetLocationIntentError: Error, CustomLocalizedStringResourceConvertible {
    case missingCoordinate

    typealias StringResources = AppShortcutsStringResources.SetLocationIntentError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .missingCoordinate: StringResources.missingCoordinate
        }
    }
}
