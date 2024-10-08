//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation

struct BarcodeModelMapper {
    func barcodeModel(from code: Code) -> BarcodeModel {
        let type: BarcodeModelType = switch code.value {
        case .code128(let value):
            BarcodeModelType.code128(code128Mapper.barcodeModel(from: value))
        case .code39(let value):
            BarcodeModelType.code39(code39Mapper.barcodeModel(from: value))
        case .codabar(let value):
            BarcodeModelType.codabar(codabarMapper.barcodeModel(from: value))
        case .ean(let value):
            BarcodeModelType.ean(eanMapper.barcodeModel(from: value))
        case .qr(let value):
            BarcodeModelType.qr(qrMapper.barcodeModel(from: value))
        }

        return BarcodeModel(
            name: code.name,
            type: type,
            location: code.location.map(locationMapper.barcodeLocation(from:)),
            date: code.date,
            createdDate: Date()
        )
    }

    func code(from model: BarcodeModel) throws -> Code {
        let value = switch model.type {
        case .code128(let model):
            try CodeValue.code128(code128Mapper.value(from: model))
        case .code39(let model):
            try CodeValue.code39(code39Mapper.value(from: model))
        case .codabar(let model):
            try CodeValue.codabar(codabarMapper.value(from: model))
        case .ean(let model):
            try CodeValue.ean(eanMapper.value(from: model))
        case .qr(let model):
            try CodeValue.qr(qrMapper.value(from: model))
        case .none:
            throw BarcodeModelMapperError.noValueSet
        }

        guard let modelName = model.name else { throw BarcodeModelMapperError.noNameSet }
        let name = if modelName.isEmpty { PersistenceStrings.BarcodeModelMapper.untitledCodeName } else { modelName }

        return Code(
            name: name,
            value: value,
            location: model.location.map(locationMapper.location(from:)),
            date: model.date
        )
    }

    // MARK: Updates

    func update(_ model: BarcodeModel, from code: Code) {
        let newModel = barcodeModel(from: code)
        model.name = newModel.name
        model.type = newModel.type
        model.location = newModel.location
        model.date = newModel.date
    }

    // MARK: Sub-mappers

    private let code128Mapper = Code128BarcodeModelMapper()
    private let code39Mapper = Code39BarcodeModelMapper()
    private let codabarMapper = CodabarBarcodeModelMapper()
    private let eanMapper = EANBarcodeModelMapper()
    private let qrMapper = QRBarcodeModelMapper()

    private let locationMapper = BarcodeLocationMapper()
}

enum BarcodeModelMapperError: Error {
    case noNameSet
    case noValueSet
}
