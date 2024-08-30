//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Navigation
import SwiftUI

@MainActor
struct WatchRouteMapper {
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .barcodeDetails(let code): WatchBarcodeView(value: code.value)
        }
    }
}
