//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcErrorHandling
import BarcRouting

struct WatchLibraryCell: View {
    private let code: Code
    private let errorHandler: any ErrorHandler
    init(code: Code, errorHandler: any ErrorHandler) {
        self.code = code
        self.errorHandler = errorHandler
    }

    var body: some View {
        Text(code.name)
    }
}
