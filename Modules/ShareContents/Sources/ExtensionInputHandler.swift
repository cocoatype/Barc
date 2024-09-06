//  Created by Geoff Pado on 9/5/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation

struct ExtensionInputHandler {
    func handleInput(from extensionContext: NSExtensionContext?) async throws -> CodeValue {
        #if os(iOS)
        return try await MobileExtensionInputHandler().handleInput(from: extensionContext)
        #elseif os(watchOS)
        return try WatchExtensionInputHandler().handleInput(from: extensionContext)
        #else
        throw ShareError.notImplementedOnPlatform
        #endif
    }
}
