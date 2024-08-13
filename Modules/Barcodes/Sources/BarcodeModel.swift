//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Foundation
import SwiftData

public struct BarcodeModel: Identifiable {
    public let type: BarcodeModelType
    public let id: ID

    public init(type: BarcodeModelType, id: ID) {
        self.type = type
        self.id = id
    }

    public init(type: BarcodeModelType, uuid: UUID) {
        self.init(type: type, id: .uuid(uuid))
    }

    public static func ean(value: String) -> BarcodeModel {
        BarcodeModel(type: .ean(EANBarcodeModel(value: value)), uuid: UUID())
    }

    public static func qr(value: String, correctionLevel: String) -> BarcodeModel {
        BarcodeModel(type: .qr(QRBarcodeModel(value: value, correctionLevel: correctionLevel)), uuid: UUID())
    }

    public enum ID: Hashable {
        case swiftData(PersistentIdentifier)
        case uuid(UUID)

        public func hash(into hasher: inout Hasher) {
            switch self {
            case .swiftData(let persistentIdentifier):
                hasher.combine(persistentIdentifier)
            case .uuid(let uuid):
                hasher.combine(uuid)
            }
        }
    }
}
