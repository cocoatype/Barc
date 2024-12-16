//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public enum Route: Hashable, Identifiable {
    case barcodeDetails(Code)
    case website(URL)

    public var id: String {
        switch self {
        case .barcodeDetails(let code): "barcodeDetails=\(code.id)"
        case .website(let url): "website=\(url.absoluteString)"
        }
    }

    public var usesSheetPresentation: Bool {
        switch self {
        case .barcodeDetails: false
        case .website: true
        }
    }
}
