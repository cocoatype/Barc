//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Routing
import Persistence
import SwiftUI

#if compiler(<6.0)
@MainActor
#endif
public struct WatchRootView: View {
    @State private var viewState = ViewState.loading
    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    public init(
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.repository = repository
        self.errorHandler = errorHandler
    }

    public var body: some View {
        Group {
            switch viewState {
            case .loading:
                ProgressView()
                    .onAppear { beginLoading() }
            case .success(let codes):
                WatchSplitView(codes: codes, errorHandler: errorHandler)
            case .empty:
                LibraryEmptyView()
            case .error(let error):
                ErrorView(error: error, errorHandler: errorHandler)
            }
        }.onUpdate(to: repository) { updateViewState(with: $0) }
    }

    private func beginLoading() {
        do {
            try updateViewState(with: repository.codes)
        } catch {
            viewState = .error(error)
        }
    }

    private func updateViewState(with codes: [Code]) {
        if codes.count > 0 {
            viewState = .success(codes)
        } else {
            viewState = .empty
        }
    }

    private enum ViewState {
        case loading
        case success([Code])
        case empty
        case error(Error)
    }
}

#Preview {
    WatchRootView(
        repository: PreviewBarcodeRepository(),
        errorHandler: PreviewErrorHandler()
    )
}
