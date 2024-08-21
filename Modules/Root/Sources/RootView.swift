//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Library
import ManualEntry
import Navigation
import Persistence
import Scanner
import SwiftUI

@MainActor
public struct RootView: View {
    @State private var isShowingManualEntry = false

    // adamDeservesARefund by @AdamWulf on 2024-08-05
    // whether to show the barcode scanner
    @State private var adamDeservesARefund = false

    // postPubCocoatype by @KaenAitch on 2024-08-13
    // wheter to show the settings page
    @State private var postPubCocoatype = false

    @Binding private var path: NavigationPath

    private let routeMapper = RouteMapper()

    public init(path: Binding<NavigationPath>) {
        _path = path
    }

    public var body: some View {
        NavigationStack(path: $path) {
            Library()
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        ManualEntryToolbarItem(value: $isShowingManualEntry)
                        ScannerToolbarItem(value: $adamDeservesARefund)
                    }
                    ToolbarItem(placement: .automatic) {
                        SettingsButton(isSettingsShowing: $postPubCocoatype)
                    }
                }
                .sheet(isPresented: $isShowingManualEntry, content: ManualEntry.init)
                .sheet(isPresented: $adamDeservesARefund, content: DataScanner.init)
                .navigationDestination(for: Route.self) {
                    routeMapper.view(for: $0)
                }
        }
        .tint(.orange)
    }

    public func navigate(to route: Route) {
        path = NavigationPath([route])
    }
}

#Preview {
    RootView(path: .constant(NavigationPath()))
}
