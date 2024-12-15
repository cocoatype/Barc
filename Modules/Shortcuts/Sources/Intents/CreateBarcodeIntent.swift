//  Created by Geoff Pado on 11/7/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes
import PDF417
import Persistence

struct CreateBarcodeIntent: AppIntent {
    static let title: LocalizedStringResource = "CreateBarcodeIntent.title"

    static let description: IntentDescription = "CreateBarcodeIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("CreateBarcodeIntent.parameterSummary\(\.$format)\(\.$value)") {
            \.$name
        }
    }

    @Parameter(
        title: "CreateBarcodeIntent.format"
    )
    var format: BarcodeFormatEntity

    @Parameter(
        title: "CreateBarcodeIntent.value"
    )
    var value: String

    @Parameter(
        title: "CreateBarcodeIntent.name"
    )
    var name: String?

    private var codeName: String {
        guard let name else { return ShortcutsStrings.CreateBarcodeIntent.defaultName }

        if name.isEmpty { return ShortcutsStrings.CreateBarcodeIntent.defaultName }
        else { return name }
    }

    func perform() async throws -> some IntentResult & ReturnsValue<BarcodeEntity> {
        let storedCode = try Code(name: codeName, value: codeValue, location: nil, date: nil)

        let repository = Persistence.defaultRepository
        try await repository.add(storedCode)
        ShortcutsProvider.updateAppShortcutParameters()

        return .result(value: BarcodeEntity(code: storedCode))
    }

    private var codeValue: CodeValue {
        get throws {
            switch format {
            case .codabar:
                try .codabar(CodabarCodeValue(payload: CodabarPayloadParser().payload(backtick: value)))
            case .code39:
                try .code39(Code39CodeValue(payload: Code39PayloadParser().payload(for: value)))
            case .code128:
                try .code128(Code128CodeValue(payload: Code128PayloadParser().payload(for: value)))
            case .ean13:
                try .ean(EANCodeValue(payload: EANPayloadParser().payload(for: value)))
            case .pdf417:
                try .pdf417(PDF417CodeValue(dataCodewords: CodewordsEncoder().dataCodewords(for: value)))
            case .qr:
                    .qr(value: value, correctionLevel: .m)
            }
        }
    }
}
