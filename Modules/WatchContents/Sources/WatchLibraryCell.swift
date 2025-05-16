//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcRouting

struct WatchLibraryCell: View {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var body: some View {
        Text(code.name)
    }
}
