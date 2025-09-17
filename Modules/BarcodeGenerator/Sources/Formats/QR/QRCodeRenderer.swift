//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit
import QRCodeGenerator

import BarcBarcodes
import BarcErrorHandling

public struct QRCodeRenderer: CodeRenderer {
    private let encodedValue: QRCode?
    init(value: QRCodeValue) {
        do {
            self.encodedValue = try
            QRCodeEncoder().encodedValue(for: value)
        } catch {
            Container.shared.errorHandler()
                .log(error, module: "BarcodeGenerator", type: "QRCodeRenderer")
            self.encodedValue = nil
        }
    }

    func renderedCode(in containerRatio: Double) -> RenderedCode {
        var code = RenderedCode()
        code.kineNoo = .ratio(1)
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
