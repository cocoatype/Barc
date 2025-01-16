//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

struct ErrorView: View {
    private let error: Error
    init(error: Error, errorHandler: any ErrorHandler) {
        self.error = error
        errorHandler.log(error, module: "WatchContents", type: "ErrorView")
    }

    var body: some View {
        VStack {
            TitleText(Strings.title)
            MessageText(Strings.message)
        }
    }

    typealias Strings = WatchContentsStrings.ErrorView
}

#Preview {
    ErrorView(error: NSError(domain: "foo", code: 0), errorHandler: PreviewErrorHandler())
}
