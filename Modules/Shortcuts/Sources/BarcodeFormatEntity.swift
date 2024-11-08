//  Created by Geoff Pado on 11/7/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes

public enum BarcodeFormatEntity: AppEntity, CaseIterable, Identifiable {
    case codabar, code39, code128, ean13, qr

    public static let defaultQuery = BarcodeFormatQuery()

    public static let typeDisplayRepresentation: TypeDisplayRepresentation = "BarcodeFormatEntity.typeDisplayRepresentation"

    // this method mostly exists to track that we represent all formats
    public init(value: CodeValue) {
        switch value {
        case .code128: self = .code128
        case .code39: self = .code39
        case .codabar: self = .codabar
        case .ean: self = .ean13
        case .qr: self = .qr
        }
    }

    public var id: String {
        switch self {
        case .codabar: "codabar"
        case .code39: "code39"
        case .code128: "code128"
        case .ean13: "ean13"
        case .qr: "qr"
        }
    }

    public var displayRepresentation: DisplayRepresentation {
        let key: StaticString = switch self {
        case .codabar: "BarcodeFormatEntity.codabar"
        case .code39: "BarcodeFormatEntity.code39"
        case .code128: "BarcodeFormatEntity.code128"
        case .ean13: "BarcodeFormatEntity.ean13"
        case .qr: "BarcodeFormatEntity.qr"
        }

        let localizedString = LocalizedStringResource(key, defaultValue: "", bundle: .atURL(Bundle.module.bundleURL))

        return DisplayRepresentation(title: localizedString)
    }
}
