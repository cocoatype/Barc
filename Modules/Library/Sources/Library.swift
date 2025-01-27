//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Routing
import Persistence
import SwiftUI

public struct Library: View {
    @Binding private var currentRoute: Route?
    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    public init(
        currentRoute: Binding<Route?>,
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        _currentRoute = currentRoute
        self.repository = repository
        self.errorHandler = errorHandler
    }

    @State private var viewState: ViewState = .loading

    @Environment(\.scenePhase) private var scenePhase

    public var body: some View {
        Group {
            switch viewState {
            case .loading:
                Color.clear
            case .loaded(let codes):
                LibraryGrid(codes: codes, repository: repository, errorHandler: errorHandler)
            case .empty:
                LibraryEmptyState(currentRoute: $currentRoute)
            case .error(let error):
                LibraryErrorView(error, errorHandler: errorHandler)
            }
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .navigationTitle(Text(LibraryStrings.Library.navigationTitle))
        .contentMargins(.vertical, LibraryGrid.spacing)
        .onAppear { refreshCodes() }
        .onUpdate(to: repository) { updateViewState(with: $0) }
        .onChange(of: scenePhase) { refreshCodes() }
    }

    @MainActor private func refreshCodes() {
        Task {
            do {
                try withAnimation {
                    try updateViewState(with: repository.codes)
                }
            } catch {
                viewState = .error(error)
            }
        }
    }

    private func updateViewState(with codes: [Code]) {
        if codes.count > 0 {
            viewState = .loaded(codes)
        } else {
            viewState = .empty
        }
    }

    enum ViewState {
        case loading
        case loaded([Code])
        case empty
        case error(Error)
    }
}

#Preview {
    Library(
        currentRoute: .constant(nil),
        repository: PreviewBarcodeRepository(result: .success([])),
        errorHandler: PreviewErrorHandler()
    )
}
