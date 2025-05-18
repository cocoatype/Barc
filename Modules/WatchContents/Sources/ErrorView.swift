//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling

struct ErrorView: View {
    @Injected(\.errorHandler) private var errorHandler
    init(error: Error) {
        errorHandler.log(error, module: "WatchContents", type: "ErrorView")
    }

    var body: some View {
        VStack {
            TitleText(Strings.title)
            MessageText(Strings.message)
        }
    }

    private typealias Strings = BarcWatchContents.Strings.ErrorView
}

#Preview {
    ErrorView(error: NSError(domain: "foo", code: 0))
}
