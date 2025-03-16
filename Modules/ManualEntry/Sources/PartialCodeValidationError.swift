//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum PartialCodeValidationError: Error, CustomLocalizedStringResourceConvertible {
    case emptyName

    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .emptyName: StringResources.PartialCodeValidationError.emptyName
        }
    }
}
