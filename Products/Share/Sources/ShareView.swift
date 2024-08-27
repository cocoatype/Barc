//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import ImageReader
import SwiftUI

struct ShareView: View {
    @Environment(\.extensionContext) private var extensionContext
    @State private var viewState = ViewState.loading

    private let errorHandler: any ErrorHandler
    private let inputHandler = ExtensionInputHandler()
    init(errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        Group {
            switch viewState {
            case .loading:
                Text("Loading…")
            case .success(let codeValue):
                CodeValueSuccessView(value: codeValue)
            case .error(let error):
                let _ = errorHandler.log(error, module: "com.cocoatype.Barc.Share", type: "ShareView")
                Text(String(describing: error))
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
