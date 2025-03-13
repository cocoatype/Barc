//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PhotoLibraryErrorView: View {
    private let error: any Error
    init(error: any Error) {
        self.error = error
    }

    var body: some View {
        Text("Hello, world!")
    }
}
