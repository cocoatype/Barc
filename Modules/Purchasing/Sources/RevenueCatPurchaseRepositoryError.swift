//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum RevenueCatPurchaseRepositoryError: Error, CustomLocalizedStringResourceConvertible {
    case noCurrentOffering
    case noProductForIdentifier(_ identifier: String)

    typealias StringResources = BarcPurchasing.StringResources.RevenueCatPurchaseRepositoryError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .noCurrentOffering: StringResources.noCurrentOffering
        case .noProductForIdentifier(let identifier): StringResources.noProductForIdentifier(identifier)
        }
    }
}
