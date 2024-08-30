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
        ZStack {
            Color.white
            GeometryReader { proxy in
                if let encodedValue {
                    let encodedRect = CGRect(origin: .zero, size: CGSize(width: encodedValue.size, height: encodedValue.size))
                    let proxyRect = proxy.frame(in: .local)
                    let drawRect = encodedRect.fitting(rect: proxyRect)
                    let drawSize = drawRect.width
                    let moduleWidth = drawSize / Double(encodedValue.size)
                    Path { path in
                        for x in 0..<encodedValue.size {
                            for y in 0..<encodedValue.size {
                                guard encodedValue.getModule(x: x, y: y) else { continue }
                                path.addRect(CGRect(x: Double(x) * moduleWidth, y: Double(y) * moduleWidth, width: moduleWidth, height: moduleWidth))
                            }
                        }
                    }
                    .offsetBy(dx: drawRect.origin.x, dy: drawRect.origin.y)
                    .fill(Color.black)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                } else {
                    Image(systemName: "nosign")
                }
            }
        }
    }
}

extension CGRect {
    func fitting(rect fittingRect: CGRect) -> CGRect {
        let aspectRatio = width / height
        let fittingAspectRatio = fittingRect.width / fittingRect.height

        if fittingAspectRatio > aspectRatio { // wider fitting rect
            let newRectWidth = aspectRatio * fittingRect.height
            let newRectHeight = fittingRect.height
            let newRectX = (fittingRect.width - newRectWidth) / 2
            let newRectY = CGFloat(0)

            return CGRect(x: newRectX, y: newRectY, width: newRectWidth, height: newRectHeight)
        } else if fittingAspectRatio < aspectRatio { // taller fitting rect
            let newRectWidth = fittingRect.width
            let newRectHeight = 1 / (aspectRatio / fittingRect.width)
            let newRectX = CGFloat(0)
            let newRectY = (fittingRect.height - newRectHeight) / 2

            return CGRect(x: newRectX, y: newRectY, width: newRectWidth, height: newRectHeight)

        } else { // same aspect ratio
            return fittingRect
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    QRCodeRenderer(value: QRCodeValue(string: "https://cocoatype.com", correctionLevel: .m))
        .frame(width: 180, height: 180)
}
