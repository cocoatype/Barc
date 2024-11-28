//  Created by Geoff Pado on 9/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation

public enum BarcodeRepositoryError: Error, CustomLocalizedStringResourceConvertible {
    case duplicateCode(named: String)

    typealias StringResources = PersistenceStringResources.BarcodeRepositoryError
    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .duplicateCode(let name): StringResources.duplicateCode(name)
        }
    }
}
