//  Created by Geoff Pado on 9/5/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation

struct ExtensionInputHandler {
    #if os(iOS)
    private let underlyingHandler = MobileExtensionInputHandler()
    #elseif os(watchOS)
    private let underlyingHandler = WatchExtensionInputHandler()
    #endif

    func handleInput(from extensionContext: NSExtensionContext?) async throws -> CodeValue {
        return try await underlyingHandler.handleInput(from: extensionContext)
    }
}
