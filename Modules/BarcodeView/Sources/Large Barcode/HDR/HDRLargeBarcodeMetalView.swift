//  Created by Geoff Pado on 5/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import MetalKit
import SwiftUI

class HDRLargeBarcodeMetalView: MTKView {
    init() {
        let device = MTLCreateSystemDefaultDevice()
        super.init(frame: .zero, device: device)

        print("metal layer: \(layer)")

        if let metalLayer = layer as? CAMetalLayer {
            metalLayer.wantsExtendedDynamicRangeContent = true
            metalLayer.colorspace = CGColorSpace(name: CGColorSpace.extendedLinearDisplayP3)
        }

        preferredFramesPerSecond = 1
        colorPixelFormat = .rgba16Float
        framebufferOnly = false
        clearColor =  MTLClearColor(red: 0, green: 0, blue: 0, alpha: 0)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("\(String(describing: type(of: Self.self))) does not implement init(coder:)")
    }
}
