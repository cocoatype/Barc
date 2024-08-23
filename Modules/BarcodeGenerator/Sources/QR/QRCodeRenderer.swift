//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftUI

public struct QRCodeRenderer: View {
    private let value: QRCodeValue
    init(value: QRCodeValue, symbolVersion: Int) {
        self.value = value
    }

    public var body: some View {
        GeometryReader { proxy in
            codeImage(size: proxy.size)
                .resizable()
                .frame(width: proxy.size.width, height: proxy.size.height)
        }.background(Color.white)
    }

    func codeImage(size: CGSize) -> Image {
        do {
            return try QRGenerator.generateQRImage(value: value, size: size)
        } catch {
            return Image(systemName: "nosign")
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    QRCodeRenderer(value: QRCodeValue(string: "https://cocoatype.com", correctionLevel: .m), symbolVersion: 1)
        .frame(width: 180, height: 180)
}
