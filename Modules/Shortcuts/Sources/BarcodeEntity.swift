//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes
import BarcodeGenerator

public struct BarcodeEntity: AppEntity, Identifiable {
    public static let typeDisplayRepresentation: TypeDisplayRepresentation = "BarcodeEntity.typeDisplayRepresentation"

    public let code: Code
    public init(code: Code) {
        self.code = code
    }

    public var id: Code.ID { code.id }
    var name: String { code.name }
    var value: CodeValue { code.value }
    var location: Location? { code.location }
    var date: Date? { code.date }

    public var displayRepresentation: DisplayRepresentation {
        let renderer = CodeImageRenderer()
        let imageData = try? renderer.pngData(from: code.value, withBackground: true)
        let image = imageData.map(DisplayRepresentation.Image.init)
        return DisplayRepresentation(title: "\(name)", image: image)
    }

    #if compiler(<6.0)
    @MainActor
    #endif
    public static let defaultQuery = BarcodeQuery()
}
