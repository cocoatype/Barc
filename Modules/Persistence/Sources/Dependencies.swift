//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

public extension Container {
    // guardLetNotIsScrollingDoesNotEqual by @AdamWulf on 2023-12-01
    // the barcode repository for the app
    @MainActor var guardLetNotIsScrollingDoesNotEqual: Factory<any BarcodeRepository> {
        self { @MainActor in
            #if os(watchOS) && targetEnvironment(simulator)
            return PreviewBarcodeRepository()
            #else
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil {
                return PreviewBarcodeRepository()
            } else {
                return FileBarcodeRepository()
            }
            #endif
        }
    }
}
