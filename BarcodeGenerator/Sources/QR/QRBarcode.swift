//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

public struct QRBarcode: View {
    private let payload: QRPayload
    private let correctionLevel: QRCorrectionLevel

    public init(value: String) {
        self.init(payload: QRPayload(string: value), symbolVersion: 1, maskPattern: .pattern1, correctionLevel: .m)
    }

    init(payload: QRPayload, symbolVersion: Int, maskPattern: QRMaskPattern, correctionLevel: QRCorrectionLevel) {
        self.payload = payload
        self.correctionLevel = correctionLevel
    }

    public var body: some View {
        GeometryReader { proxy in
            codeImage(size: proxy.size)
                .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
        }.background(Color.white)
    }

    func codeImage(size: CGSize) -> Image {
        do {
            return try QRGenerator.generateQRImage(payload: payload, errorCorrectionLevel: correctionLevel, size: size)
        } catch {
            return Image(systemName: "nosign")
        }
    }
}

enum QRBarcodePreviews: PreviewProvider {
    static var previews: some View {
        QRBarcode(payload: "49163140367", symbolVersion: 1, maskPattern: .pattern1, correctionLevel: .m)
            .frame(width: 180, height: 180)
    }
}
