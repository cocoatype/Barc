//  Created by Geoff Pado on 6/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing

import ViewInspector

import BarcRouting

@testable import BarcRoot

@MainActor
struct ScannerPresentingButtonTests {
    @Test func presentsScanner() throws {
        let currentRoute = Binding(wrappedValue: Route?.none)
        let button = ScannerPresentingButton(presenting: currentRoute)

        try button.inspect().button().tap()
        #expect(currentRoute.wrappedValue == .scanner)
    }
}
