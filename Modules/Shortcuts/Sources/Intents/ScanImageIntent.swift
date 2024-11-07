//  Created by Geoff Pado on 11/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes
import ImageReader
import CoreGraphics

struct ScanImageIntent: AppIntent {
    static let title: LocalizedStringResource = "ScanImageIntent.title"

    static let description: IntentDescription = "ScanImageIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("ScanImageIntent.parameterSummary\(\.$image)")
    }

    @Parameter(
        title: "ScanImageIntent.image.title"
    )
    var image: IntentFile

    func perform() async throws -> some IntentResult & ReturnsValue<BarcodeEntity?> {
        let image = try CGImage.image(from: image.data)
        let imageReader = ImageReader()
        let codeValue = try await imageReader.codeValue(in: image)

        let code = codeValue.map {
            Code(name: "Scanned Code", value: $0, location: nil, date: nil)
        }.map(BarcodeEntity.init(code:))

        return .result(value: code)
    }
}
