//  Created by Geoff Pado on 10/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Synchronization

import FactoryKit

import BarcDefaults

@MainActor struct ManualEntryDefaultFormatHandler: Sendable {
    @Injected(\.defaultsProvider) private var defaults

    func newPartialCode() -> PartialCode {
        return PartialCode(type: defaultFormat ?? .qr)
    }

    func updateDefaultFormat(to newDefaultFormat: PartialCode.BarcodeFormat) {
        let formatValue = switch newDefaultFormat {
        case .codabar: "codabar"
        case .code39: "code39"
        case .code128: "code128"
        case .itf: "itf"
        case .ean: "ean"
        case .pdf417: "pdf417"
        case .qr: "qr"
        }

        defaults.set(formatValue, for: Keys.manualEntryFormat)
    }

    private var defaultFormat: PartialCode.BarcodeFormat? {
        return switch defaults.value(for: Keys.manualEntryFormat) {
        case "codabar": .codabar
        case "code39": .code39
        case "code128": .code128
        case "itf": .itf
        case "ean": .ean
        case "pdf417": .pdf417
        case "qr": .qr
        default: nil
        }
    }
}
