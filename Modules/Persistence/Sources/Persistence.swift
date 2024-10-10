//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public let defaultRepository: any BarcodeRepository = {
    if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil {
        return PreviewBarcodeRepository()
    } else {
        return FileBarcodeRepository()
    }
}()
