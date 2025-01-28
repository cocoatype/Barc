//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Routing
import Persistence
import SwiftUI

public struct WatchRootView: View {
    @State private var selectedCode: Code?
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
                WatchSplitView(
                    codes: codes,
                    selectedCode: $selectedCode,
                    errorHandler: errorHandler
                )
            case .empty:
                LibraryEmptyView()
            case .error(let error):
                ErrorView(error: error, errorHandler: errorHandler)
            }
        }
        .onUpdate(to: repository) { updateViewState(with: $0) }
        .onOpenURL { handle($0) }
    }

    private func handle(_ url: URL) {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true),
              url.pathComponents.count > 1,
              url.pathComponents[1] == "details",
              let queryItems = urlComponents.queryItems,
              let codeValueItem = queryItems.first(where: { $0.name == "codeValue" }),
              let codeValue = codeValueItem.value,
              let codeData = Data(base64Encoded: codeValue),
              let decodedValue = String(data: codeData, encoding: .utf8)
        else { return }

        do {
            let codes = try repository.codes
            let matchingCode = codes.first(where: { $0.id == decodedValue })

            updateViewState(with: codes, selectedCode: matchingCode)
        } catch {
            errorHandler.log(error, module: "WatchContents", type: "WatchRootView")
        }
    }

    private func beginLoading() {
        do {
            try updateViewState(with: repository.codes)
        } catch {
            viewState = .error(error)
        }
    }

    private func updateViewState(with codes: [Code], selectedCode: Code? = nil) {
        if codes.count > 0 {
            viewState = .success(codes: codes)
            self.selectedCode = selectedCode ?? codes.first
        } else {
            viewState = .empty
            self.selectedCode = nil
        }
    }

    private enum ViewState {
        case loading
        case success(codes: [Code])
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
