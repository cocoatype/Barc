//  Created by Geoff Pado on 1/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling

struct LibraryErrorView: View {
    private let error: any Error
    init(
        _ error: any Error
    ) {
        self.error = error
        Container.shared.errorHandler()
            .log(error, module: "Library", type: "LibraryErrorView")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading) {
                Text(Strings.LibraryErrorView.title)
                    .font(.headline)
                ErrorMessageText(Strings.LibraryErrorView.message)
            }
            Text(String(describing: error))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: 320)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
