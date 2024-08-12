//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct BarcodeRepositoryEnvironmentKey: EnvironmentKey {
    public static let defaultValue: any BarcodeRepository = FileBarcodeRepository()
}

public extension EnvironmentValues {
    // guardLetNotIsScrollingDoesNotEqual by @AdamWulf on 2023-12-01
    // the barcode repository for the app
    var guardLetNotIsScrollingDoesNotEqual: any BarcodeRepository {
        get { self[BarcodeRepositoryEnvironmentKey.self] }
        set { self[BarcodeRepositoryEnvironmentKey.self] = newValue }
    }
}