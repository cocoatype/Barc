//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Vision

public enum BarcodeResultMapperError: Error, CustomLocalizedStringResourceConvertible {
    case missingPayloadStringValue
    case invalidSymbology(VNBarcodeSymbology)

    typealias StringResources = ImageReaderStringResources.BarcodeResultMapperError
    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .missingPayloadStringValue: StringResources.missingPayloadStringValue
        case .invalidSymbology(let symbology): StringResources.invalidSymbology(symbology)
        }
    }
}
