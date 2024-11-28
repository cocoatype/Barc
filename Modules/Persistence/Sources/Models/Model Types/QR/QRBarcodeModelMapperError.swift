//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum QRBarcodeModelMapperError: Error, CustomLocalizedStringResourceConvertible {
    case invalidCorrectionLevel(_ correctionLevel: String)

    typealias StringResources = PersistenceStringResources.QRBarcodeModelMapperError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .invalidCorrectionLevel(let correctionLevel):
            StringResources.invalidCorrectionLevel(correctionLevel)
        }
    }
}
