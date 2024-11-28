//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum PartialCodeValidationError: Error, CustomLocalizedStringResourceConvertible {
    case emptyName

    typealias StringResources = ManualEntryStringResources.PartialCodeValidationError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .emptyName: StringResources.emptyName
        }
    }
}
