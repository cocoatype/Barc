//  Created by Geoff Pado on 5/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct HDRLargeBarcodeContents: UIViewRepresentable {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    func makeUIView(context: Context) -> some UIView {
        let view = HDRLargeBarcodeMetalView()
        view.delegate = context.coordinator
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}

    func makeCoordinator() -> HDRLargeBarcodeMetalViewDelegate {
        HDRLargeBarcodeMetalViewDelegate(value: value)
    }
}
