//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public enum CodabarPayloadParseError: Error, CustomLocalizedStringResourceConvertible {
    case extraStartStopSymbol
    case missingStartStopSymbol

    typealias StringResources = BarcBarcodes.StringResources.CodabarPayloadParseError
    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .extraStartStopSymbol: StringResources.extraStartStopSymbol
        case .missingStartStopSymbol: StringResources.missingStartStopSymbol
        }
    }
}
