//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import WidgetKit

import BarcBarcodes
import BarcErrorHandling
import BarcRouting
import BarcPersistence

public struct WatchRootView: View {
    @State private var selectedCode: Code?
    @State private var viewState: ViewState
    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    public init(
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.repository = repository
        self.errorHandler = errorHandler

        do {
            let codes = try repository.codes
            if let firstCode = codes.first {
                _viewState = State(initialValue: .codes(codes))
                _selectedCode = State(initialValue: firstCode)
            } else {
                _viewState = State(initialValue: .empty)
            }
        } catch {
            _viewState = State(initialValue: .error(error))
        }
    }

    public var body: some View {
        Group {
            switch viewState {
            case .codes(let codes):
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
        .onUpdate(to: repository) {
            updateViewState(with: $0)
            WidgetCenter.shared.invalidateConfigurationRecommendations()
        }
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
            updateViewState(with: codes)

            if let matchingCode = codes.first(where: { $0.id == decodedValue }) {
                selectedCode = matchingCode
            }
        } catch {
            viewState = .error(error)
        }
    }

    private func updateViewState(with codes: [Code]) {
        if codes.count > 0 {
            viewState = .codes(codes)
        } else {
            viewState = .empty
            selectedCode = nil
        }
    }

    private enum ViewState {
        case codes([Code])
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
