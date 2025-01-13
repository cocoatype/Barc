//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import Persistence
import SwiftUI

public struct Library: View {
    public init() {}

    @State private var viewState: ViewState = .loading

    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository

    public var body: some View {
        Group {
            switch viewState {
            case .loading:
                Color.clear
            case .loaded(let codes):
                LibraryGrid(codes: codes)
            case .empty:
                LibraryEmptyState()
            case .error(let error):
                LibraryErrorView(error)
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
    Library()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository(result: .failure(ConversionError.invalidByte(0))))
}
