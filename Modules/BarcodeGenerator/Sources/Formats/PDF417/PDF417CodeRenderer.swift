//  Created by Geoff Pado on 12/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import PDF417
import SwiftUI

public struct PDF417CodeRenderer: CodeRenderer {
    private let encodedValue: [[Bool]]
    private let errorHandler: any ErrorHandler
    init(value: PDF417CodeValue, errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
        do {
            self.encodedValue = try PDF417CodeEncoder().encodedValue(for: value)
        } catch {
            errorHandler.log(error, module: "BarcodeGenerator", type: "PDF417CodeRenderer")
            self.encodedValue = []
        }
    }

    var renderedCode: RenderedCode {
        var code = RenderedCode()
        for rowIndex in 0..<encodedValue.count {
            let row = encodedValue[rowIndex]
            for columnIndex in 0..<row.count {
                if row[columnIndex] {
                    code.addRect(CGRect(x: Double(columnIndex), y: Double(rowIndex), width: 1, height: 1))
                }
            }
        }

        return code
    }
}
