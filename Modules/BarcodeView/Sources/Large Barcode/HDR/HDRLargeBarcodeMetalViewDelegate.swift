//  Created by Geoff Pado on 5/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import MetalKit

import BarcBarcodes

class HDRLargeBarcodeMetalViewDelegate: NSObject, MTKViewDelegate {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}

    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let device = view.device,
              let commandQueue = device.makeCommandQueue(),
              let commandBuffer = commandQueue.makeCommandBuffer(),
              let renderPassDescriptor = view.currentRenderPassDescriptor else {
            return
        }

        // Your custom rendering code goes here
        // For now, just clear to a color
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(red: 2, green: 2, blue: 2, alpha: 1)
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].storeAction = .store

        let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderEncoder?.endEncoding()

        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
