//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes

public struct BarcodeEntity: AppEntity, Identifiable {
    public static let typeDisplayRepresentation: TypeDisplayRepresentation = "BarcodeEntity.typeDisplayRepresentation"

    public let code: Code
    public init(code: Code) {
        self.code = code
    }

    public var id: Code.ID { code.id }
    var name: String { code.name }
    var value: CodeValue { code.value }

    public var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)")
    }

    #if compiler(<6.0)
    @MainActor
    #endif
    public static let defaultQuery = BarcodeQuery()
}
