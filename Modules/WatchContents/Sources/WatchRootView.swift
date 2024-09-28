//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Navigation
import Persistence
import SwiftUI

#if compiler(<6.0)
@MainActor
#endif
public struct WatchRootView: View {
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    @State private var viewState = ViewState.loading
    public init() {}

    public var body: some View {
        Group {
            switch viewState {
            case .loading:
                ProgressView()
                    .onAppear { beginLoading() }
            case .success(let codes):
                WatchSplitView(codes: codes)
            case .empty:
                LibraryEmptyView()
            case .error(let error):
                ErrorView(error: error)
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
    WatchRootView()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
