//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

public struct RenderedCodeView: View {
    private let value: CodeValue
    public init(value: CodeValue) {
        self.value = value
    }

    public var body: some View {
        RenderedCodeShape(value: value)
            .fill(Color.black)
    }
}

import PDF417
#Preview(traits: .fixedLayout(width: 517, height: 180)) {
    try! RenderedCodeView(
        value: .pdf417(PDF417CodeValue(dataCodewords: CodewordsEncoder().dataCodewords(for: "1234567890123456")))
    )
}
