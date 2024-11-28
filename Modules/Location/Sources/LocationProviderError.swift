//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum LocationProviderError: Error, CustomLocalizedStringResourceConvertible {
    case noLocationReturned
    case noPlacemarkReturned

    typealias StringResources = LocationStringResources.LocationProviderError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .noLocationReturned: StringResources.noLocationReturned
        case .noPlacemarkReturned: StringResources.noPlacemarkReturned
        }
    }
}
