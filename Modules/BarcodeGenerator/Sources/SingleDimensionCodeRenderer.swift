//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct SingleDimensionCodeRenderer: CodeRenderer {
    private let encodedValue: [Bool]
    init(encodedValue: [Bool]) {
        self.encodedValue = encodedValue
    }

    var renderedCode: RenderedCode {
        var code = RenderedCode()
        for i in 0..<encodedValue.count {
            guard encodedValue[i] else { continue }
            code.addRect(CGRect(x: Double(i), y: 0, width: 1, height: 1))
        }
        return code
    }
}
