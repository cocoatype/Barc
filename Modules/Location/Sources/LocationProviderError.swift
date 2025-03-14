//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum LocationProviderError: Error, CustomLocalizedStringResourceConvertible {
    case noLocationReturned
    case noPlacemarkReturned

    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .noLocationReturned:
            StringResources.LocationProviderError.noLocationReturned
        case .noPlacemarkReturned:
            StringResources.LocationProviderError.noPlacemarkReturned
        }
    }
}
