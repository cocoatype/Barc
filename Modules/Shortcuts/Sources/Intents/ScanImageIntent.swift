//  Created by Geoff Pado on 11/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes
import CoreGraphics
import ImageReader
import Persistence

struct ScanImageIntent: AppIntent {
    static let title: LocalizedStringResource = "ScanImageIntent.title"

    static let description: IntentDescription = "ScanImageIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("ScanImageIntent.parameterSummary\(\.$image)")
    }

    @Parameter(
        title: "ScanImageIntent.image"
    )
    var image: IntentFile

    func perform() async throws -> some IntentResult & ReturnsValue<BarcodeEntity?> {
        let image = try CGImage.image(from: image.data)
        let imageReader = ImageReader()
        let codeValue = try await imageReader.codeValue(in: image)

        let storedCode = codeValue.map {
            Code(name: "Scanned Code", value: $0, location: nil, date: nil)
        }

        if let storedCode {
            let repository = Persistence.defaultRepository
            try await repository.add(storedCode)
        }

        return .result(value: storedCode.map(BarcodeEntity.init(code:)))
    }
}
