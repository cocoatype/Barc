//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Navigation
import Persistence
import SwiftUI

#if compiler(<6.0)
@MainActor
#endif
public struct WatchRootView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            WatchLibraryView()
                .navigationDestination(for: Route.self) {
                    mapper.view(for: $0)
                }
        }
    }

    private let mapper = WatchRouteMapper()
}

#Preview {
    WatchRootView()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
