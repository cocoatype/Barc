//  Created by Geoff Pado on 9/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import BarcBarcodes

public enum BarcodeRepositoryError: Error, CustomLocalizedStringResourceConvertible {
    case duplicateCode(original: Code)

    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .duplicateCode(let code): StringResources.BarcodeRepositoryError.duplicateCode(code.name)
        }
    }
}
