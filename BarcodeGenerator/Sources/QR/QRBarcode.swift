//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

struct QRBarcode: View {
    private let payload: QRPayload
    private let correctionLevel: QRCorrectionLevel

    init(payload: QRPayload, symbolVersion: Int, maskPattern: QRMaskPattern, correctionLevel: QRCorrectionLevel) {
        self.payload = payload
        self.correctionLevel = correctionLevel
    }

    var body: some View {
        GeometryReader { proxy in
            (try? QRGenerator.generateQRImage(payload: payload, errorCorrectionLevel: correctionLevel, size: proxy.size)) ?? Image(systemName: "nosign")
        }
    }
}

enum QRBarcodePreviews: PreviewProvider {
    static var previews: some View {
        QRBarcode(payload: "49163140367", symbolVersion: 1, maskPattern: .pattern1, correctionLevel: .m)
            .frame(width: 180, height: 180)
    }
}
