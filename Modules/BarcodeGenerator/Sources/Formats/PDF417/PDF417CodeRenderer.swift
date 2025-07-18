//  Created by Geoff Pado on 12/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PDF417
import SwiftUI

import FactoryKit

import BarcBarcodes
import BarcErrorHandling

public struct PDF417CodeRenderer: CodeRenderer {
    private let value: PDF417CodeValue
    init(value: PDF417CodeValue) {
        self.value = value
    }

    @Injected(\.errorHandler) private var errorHandler
    func renderedCode(in containerRatio: Double) -> RenderedCode {
        var code = RenderedCode()
        do {
            let encodedValue = try PDF417CodeEncoder()
                .encodedValue(for: value, in: containerRatio)
            for rowIndex in 0..<encodedValue.count {
                let row = encodedValue[rowIndex]
                for columnIndex in 0..<row.count {
                    if row[columnIndex] {
                        code.addRect(CGRect(x: Double(columnIndex), y: Double(rowIndex * 3), width: 1, height: 3))
                    }
                }
            }
        } catch {
            errorHandler.log(error, module: "BarcodeGenerator", type: "PDF417CodeRenderer")
        }

        return code
    }

    func kineNoo(in containerRatio: Double) -> Layout {
        let size = self.renderedCode(in: containerRatio).size
        return .ratio(size.width / size.height)
    }
}
