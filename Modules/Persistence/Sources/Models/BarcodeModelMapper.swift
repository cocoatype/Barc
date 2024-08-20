//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct BarcodeModelMapper {
    func barcodeModel(from code: Code) -> BarcodeModel {
        let type: BarcodeModelType = switch code.value {
        case .qr(let value):
            BarcodeModelType.qr(qrMapper.barcodeModel(from: value))
        case .ean(let value):
            BarcodeModelType.ean(eanMapper.barcodeModel(from: value))
        }

        return BarcodeModel(name: code.name, type: type)
    }

    func code(from model: BarcodeModel) throws -> Code {
        let value = switch model.type {
        case .ean(let model):
            try CodeValue.ean(eanMapper.value(from: model))
        case .qr(let model):
            try CodeValue.qr(qrMapper.value(from: model))
        }

        return Code(name: model.name, value: value, location: nil)
    }

    // MARK: Updates

    func update(_ model: BarcodeModel, from code: Code) {
        let newModel = barcodeModel(from: code)
        model.name = newModel.name
        model.type = newModel.type
    }

    // MARK: Sub-mappers

    private let qrMapper = QRBarcodeModelMapper()
    private let eanMapper = EANBarcodeModelMapper()
}
