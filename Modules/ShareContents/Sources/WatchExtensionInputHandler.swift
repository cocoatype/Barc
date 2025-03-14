//  Created by Geoff Pado on 9/5/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import BarcBarcodes

#if os(watchOS)
struct WatchExtensionInputHandler {
    func handleInput(from extensionContext: NSExtensionContext?) throws -> CodeValue {
        throw ShareError.notImplementedOnPlatform
    }
}
#endif
