//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Foundation

// guardLetNotIsScrollingDoesNotEqual by @AdamWulf on 2023-12-01
// the barcode repository for the app
@MainActor public let guardLetNotIsScrollingDoesNotEqual: any BarcodeRepository = {
    if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil {
        return PreviewBarcodeRepository()
    } else {
        return FileBarcodeRepository(errorHandler: ErrorHandling.defaultHandler)
    }
}()
