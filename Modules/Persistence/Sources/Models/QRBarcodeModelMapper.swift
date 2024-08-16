//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct QRBarcodeModelMapper {
    func barcodeModel(from value: QRCodeValue) -> QRBarcodeModel {
        let correctionLevel = switch value.correctionLevel {
        case .l: "L"
        case .m: "M"
        case .q: "Q"
        case .h: "H"
        }

        return QRBarcodeModel(
            value: value.payload.data,
            correctionLevel: correctionLevel
        )
    }

    func value(from model: QRBarcodeModel) throws -> QRCodeValue {
        let correctionLevel: QRCodeValue.CorrectionLevel = switch model.correctionLevel {
        case "L": .l
        case "M": .m
        case "Q": .q
        case "H": .h
        default: throw QRBarcodeModelMapperError.invalidCorrectionLevel(model.correctionLevel)
        }

        let payload = QRCodeValue.Payload(data: model.value)

        return QRCodeValue(payload: payload, correctionLevel: correctionLevel)
    }
}

enum QRBarcodeModelMapperError: Error {
    case invalidCorrectionLevel(String)
}
