//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public enum EANPayloadParseError: Error, CustomLocalizedStringResourceConvertible {
    case invalidBarcodeValue(String)

    typealias StringResources = BarcodesStringResources.EANPayloadParseError
    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .invalidBarcodeValue(let string): StringResources.invalidBarcodeValue(string)
        }
    }
}
