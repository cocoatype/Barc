//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Navigation
import SwiftUI

struct WatchLibraryCell: View {
    private let code: Code
    private let errorHandler: any ErrorHandler
    init(code: Code, errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.code = code
        self.errorHandler = errorHandler
    }

    var body: some View {
        Text(code.name)
    }
}
