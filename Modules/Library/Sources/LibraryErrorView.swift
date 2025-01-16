//  Created by Geoff Pado on 1/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

struct LibraryErrorView: View {
    private let error: any Error
    init(
        _ error: any Error,
        errorHandler: any ErrorHandler
    ) {
        self.error = error
        errorHandler.log(error, module: "Library", type: "LibraryErrorView")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading) {
                Text(LibraryStrings.LibraryErrorView.title)
                    .font(.headline)
                ErrorMessageText(LibraryStrings.LibraryErrorView.message)
            }
            Text(String(describing: error))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: 320)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
