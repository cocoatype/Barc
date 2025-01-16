//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import QRCodeGenerator
import SwiftUI

public struct QRCodeRenderer: CodeRenderer {
    private let encodedValue: QRCode?
    init(value: QRCodeValue, errorHandler: any ErrorHandler) {
        do {
            self.encodedValue = try
            QRCodeEncoder().encodedValue(for: value)
        } catch {
            errorHandler.log(error, module: "BarcodeGenerator", type: "QRCodeRenderer")
            self.encodedValue = nil
        }
    }

    var renderedCode: RenderedCode {
        var code = RenderedCode()
        guard let encodedValue else { return code }

        for x in 0..<encodedValue.size {
            for y in 0..<encodedValue.size {
                guard encodedValue.getModule(x: x, y: y) else { continue }
                code.addRect(CGRect(x: Double(x), y: Double(y), width: 1, height: 1))
            }
        }

        return code
    }
}
