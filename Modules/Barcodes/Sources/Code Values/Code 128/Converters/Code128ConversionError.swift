//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum Code128ConversionError: Error, CustomLocalizedStringResourceConvertible {
    case noEquivalentCharacter(Code128Element)
    case missingStartSymbol
    case missingStopSymbol
    case missingCheckDigit

    typealias StringResources = BarcodesStringResources.Code128ConversionError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .noEquivalentCharacter: StringResources.noEquivalentCharacter
        case .missingStartSymbol: StringResources.missingStartSymbol
        case .missingStopSymbol: StringResources.missingStopSymbol
        case .missingCheckDigit: StringResources.missingCheckDigit
        }
    }
}
