//  Created by Geoff Pado on 11/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import CoreGraphics

import FactoryKit

import BarcBarcodes
import BarcImageReader
import BarcPersistence
import BarcShortcutsModels

struct ScanImageIntent: AppIntent {
    static let title: LocalizedStringResource = "ScanImageIntent.title"

    static let description: IntentDescription = "ScanImageIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("ScanImageIntent.parameterSummary\(\.$image)") {
            \.$name
        }
    }

    @Parameter(
        title: "ScanImageIntent.image"
    )
    var image: IntentFile

    @Parameter(
        title: "ScanImageIntent.name"
    )
    var name: String?

    private var codeName: String {
        guard let name else { return Strings.ScanImageIntent.defaultName }

        if name.isEmpty { return Strings.ScanImageIntent.defaultName }
        else { return name }
    }

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<BarcodeEntity?> {
        let image = try CGImage.image(from: image.data)
        let imageReader = ImageReader()
        let codeValue = try await imageReader.codeValue(in: image)

        let storedCode = codeValue.map {
            Code(name: codeName, value: $0)
        }

        if let storedCode {
            let repository = Container.shared.guardLetNotIsScrollingDoesNotEqual()
            try repository.add(storedCode)
            ShortcutsProvider.updateAppShortcutParameters()
        }

        return .result(value: storedCode.map {
            BarcodeEntity(code: $0)
        })
    }
}
