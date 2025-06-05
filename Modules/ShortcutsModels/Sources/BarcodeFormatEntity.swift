//  Created by Geoff Pado on 11/7/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents

import BarcBarcodes

public enum BarcodeFormatEntity: AppEntity, CaseIterable, Identifiable {
    case codabar, code39, code128, ean13, itf, pdf417, qr

    public static let defaultQuery = BarcodeFormatQuery()
    
    public static let typeDisplayRepresentation: TypeDisplayRepresentation = "BarcodeFormatEntity.typeDisplayRepresentation"
    
    // this method mostly exists to track that we represent all formats
    public init(value: CodeValue) {
        switch value {
        case .codabar: self = .codabar
        case .code39: self = .code39
        case .code128: self = .code128
        case .ean: self = .ean13
        case .itf: self = .itf
        case .pdf417: self = .pdf417
        case .qr: self = .qr
        }
    }
    
    public var id: String {
        switch self {
        case .codabar: "codabar"
        case .code39: "code39"
        case .code128: "code128"
        case .ean13: "ean13"
        case .itf: "itf"
        case .pdf417: "pdf417"
        case .qr: "qr"
        }
    }
    
    private typealias StringResources = BarcShortcutsModels.StringResources.BarcodeFormatEntity
    public var displayRepresentation: DisplayRepresentation {
        let resource: LocalizedStringResource = switch self {
        case .codabar: StringResources.codabar
        case .code39: StringResources.code39
        case .code128: StringResources.code128
        case .ean13: StringResources.ean13
        case .itf: StringResources.itf
        case .pdf417: StringResources.pdf417
        case .qr: StringResources.qr
        }

        return DisplayRepresentation(title: resource)
    }
}
