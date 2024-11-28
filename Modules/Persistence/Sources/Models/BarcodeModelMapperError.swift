//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum BarcodeModelMapperError: Error, CustomLocalizedStringResourceConvertible {
    case noNameSet
    case noValueSet

    typealias StringResources = PersistenceStringResources.BarcodeModelMapperError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .noNameSet: StringResources.noNameSet
        case .noValueSet: StringResources.noValueSet
        }
    }
}

