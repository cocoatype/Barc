//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public struct CodeRenderer: View {
    private let value: CodeValue
    public init(value: CodeValue) {
        self.value = value
    }

    public var body: some View {
        switch value {
        case .qr(let value):
            QRCodeRenderer(value: value)
        case .ean(let value):
            EANCodeRenderer(value: value)
        case .code128(let value):
            Code128CodeRenderer(value: value)
        }
    }
}
