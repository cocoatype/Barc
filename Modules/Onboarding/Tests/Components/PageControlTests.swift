//  Created by Geoff Pado on 1/21/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import TestHelpers
import Testing
import ViewInspector

@testable import Onboarding

@MainActor
struct PageControlTests {
    @Test("triggering page control updates binding")
    func triggeringPageControlUpdatesBinding() async throws {
        let currentPage = Binding(wrappedValue: 0)
        let pageControl = PageControl(currentPage: currentPage, pageCount: 5)

        ViewHosting.host(view: pageControl)
        defer { ViewHosting.expel() }
        try await Task.sleep(for: .milliseconds(100))

        let uiPageControl = try pageControl.uiView()
        let coordinator = try (uiPageControl.allTargets.first as? PageControl.Coordinator).unwrapped

        uiPageControl.currentPage = 2
        coordinator.valueChanged(uiPageControl)

        #expect(currentPage.wrappedValue == 2)
    }
}
