//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum PlacemarkMapperError: Error, CustomLocalizedStringResourceConvertible {
    case missingCoordinate

    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .missingCoordinate: StringResources.PlacemarkMapperError.missingCoordinate
        }
    }
}
