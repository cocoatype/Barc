//  Created by Geoff Pado on 11/7/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents

import FactoryKit
import PDF417

import BarcBarcodes
import BarcPersistence
import BarcShortcutsModels

struct CreateBarcodeIntent: AppIntent {
    static let title: LocalizedStringResource = "CreateBarcodeIntent.title"

    static let description: IntentDescription = "CreateBarcodeIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("CreateBarcodeIntent.parameterSummary\(\.$format)\(\.$value)") {
            \.$name
            \.$duplicateHandling
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

    @Parameter(
        title: "CreateBarcodeIntent.duplicateHandling",
        default: .showError
    )
    var duplicateHandling: DuplicateHandling

    private var codeName: String {
        guard let name, name.isEmpty == false
        else { return Strings.CreateBarcodeIntent.defaultName }

        return name
    }

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<BarcodeEntity> {
        let storedCode = try Code(name: codeName, value: codeValue, location: nil, date: nil)

        do {
            let repository = Container.shared.guardLetNotIsScrollingDoesNotEqual()
            try repository.add(storedCode)
            ShortcutsProvider.updateAppShortcutParameters()
        } catch let BarcodeRepositoryError.duplicateCode(original: duplicateCode) {
            switch duplicateHandling {
            case .returnOriginal:
                return .result(value: BarcodeEntity(code: duplicateCode))
            case .showError:
                throw BarcodeRepositoryError.duplicateCode(original: duplicateCode)
            }
        }

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
            case .itf:
                try .itf(ITFCodeValue(payload: ITFPayloadParser().payload(for: value)))
            case .pdf417:
                try .pdf417(PDF417CodeValue(dataCodewords: CodewordsEncoder().dataCodewords(for: value)))
            case .qr:
                    .qr(value: value, correctionLevel: .m)
            }
        }
    }

    enum DuplicateHandling: String, AppEnum {
        case returnOriginal
        case showError

        static let typeDisplayRepresentation: TypeDisplayRepresentation = "CreateBarcodeIntent.DuplicateHandling.typeDisplayRepresentation"

        static let caseDisplayRepresentations: [CreateBarcodeIntent.DuplicateHandling : DisplayRepresentation] = [
            .returnOriginal: "CreateBarcodeIntent.DuplicateHandling.returnOriginal",
            .showError: "CreateBarcodeIntent.DuplicateHandling.showError",
        ]
    }
}
