//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum PurchaseOptionMapperError: Error, CustomLocalizedStringResourceConvertible {
    case missingCurrencyCode
    case unknownPackageType

    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .missingCurrencyCode:
            StringResources.PurchaseOptionMapperError.missingCurrencyCode
        case .unknownPackageType:
            StringResources.PurchaseOptionMapperError.unknownPackageType
        }
    }
}
