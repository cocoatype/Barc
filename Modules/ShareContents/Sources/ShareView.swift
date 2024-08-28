//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ImageReader
import SwiftUI

public struct ShareView: View {
    @Environment(\.extensionContext) private var extensionContext
    @State private var viewState = ViewState.loading

    private let inputHandler = ExtensionInputHandler()
    public init() {}

    public var body: some View {
        Group {
            switch viewState {
            case .loading:
                LoadingView()
            case .success(let codeValue):
                SuccessView(value: codeValue)
            case .error(let error):
                ErrorView(error: error)
            }
        }
        .tint(.primary)
        .task {
            await handleExtensionContext()
        }
    }

    private func handleExtensionContext() async {
        do {
            let codeValue = try await inputHandler.handleInput(from: extensionContext)
            viewState = .success(codeValue)
        } catch {
            viewState = .error(error)
        }
    }

    enum ViewState {
        case loading
        case success(CodeValue)
        case error(Error)
    }
}

#Preview {
    ShareView()
}
