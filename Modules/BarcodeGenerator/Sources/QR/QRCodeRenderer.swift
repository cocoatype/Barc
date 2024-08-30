//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import QRCodeGenerator
import SwiftUI

public struct QRCodeRenderer: View {
    private let encodedValue: QRCode?
    init(value: QRCodeValue, errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        do {
            self.encodedValue = try
            QRCodeEncoder().encodedValue(for: value)
        } catch {
            errorHandler.log(error, module: "com.cocoatype.Barc.BarcodeGenerator", type: "QRCodeRenderer")
            self.encodedValue = nil
        }
    }

    public var body: some View {
        GeometryReader { proxy in
            if let encodedValue {
                let moduleWidth = proxy.size.width / Double(encodedValue.size)
                Path { path in
                    for x in 0..<encodedValue.size {
                        for y in 0..<encodedValue.size {
                            guard encodedValue.getModule(x: x, y: y) else { continue }
                            path.addRect(CGRect(x: Double(x) * moduleWidth, y: Double(y) * moduleWidth, width: moduleWidth, height: moduleWidth))
                        }
                    }
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            } else {
                Image(systemName: "nosign")
            }
        }.background(Color.white)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    QRCodeRenderer(value: QRCodeValue(string: "https://cocoatype.com", correctionLevel: .m))
        .frame(width: 180, height: 180)
}
