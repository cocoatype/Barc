//  Created by Geoff Pado on 9/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import BarcBarcodes

public enum BarcodeRepositoryError: Error, CustomLocalizedStringResourceConvertible {
    case duplicateCode(named: String)

    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .duplicateCode(let name): StringResources.BarcodeRepositoryError.duplicateCode(name)
        }
    }
}
