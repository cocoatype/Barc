//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes

struct BarcodeEntity: AppEntity, Identifiable {
    static let typeDisplayRepresentation: TypeDisplayRepresentation = "BarcodeEntity.typeDisplayRepresentation"

    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var id: Code.ID { code.id }
    var name: String { code.name }
    var value: CodeValue { code.value }

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)")
    }

    static let defaultQuery = BarcodeQuery()
}
