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
        switch viewState {
        case .loading:
            ProgressView()
                .onAppear {
                    do {
                        let codes = try repository.codes
                        if codes.count > 0 {
                            viewState = .success(codes)
                        } else {
                            viewState = .empty
                        }
                    } catch {
                        viewState = .error(error)
//                        errorHandler.log(error, module: "com.cocoatype.Barc.Library", type: "LibraryGrid")
                    }
                }
        case .success(let codes):
            WatchSplitView(codes: codes)
        case .empty:
            Text("No codes… :(")
        case .error(let error):
            Text(String(describing: error))
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
