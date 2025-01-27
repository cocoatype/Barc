//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public enum Route: Hashable, Identifiable {
    case barcodeDetails(Code)
    case manualEntry
    case menu
    case onboarding
    case paywall
    case scanner
    case website(URL)

    public var id: String {
        switch self {
        case .barcodeDetails(let code): "barcodeDetails=\(code.id)"
        case .manualEntry: "manualEntry"
        case .menu: "menu"
        case .onboarding: "onboarding"
        case .paywall: "paywall"
        case .scanner: "scanner"
        case .website(let url): "website=\(url.absoluteString)"
        }
    }

    public var usesSheetPresentation: Bool {
        switch self {
        case .barcodeDetails: false
        case .manualEntry, .menu, .onboarding, .paywall, .scanner, .website: true
        }
    }
}
