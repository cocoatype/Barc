//  Created by Geoff Pado on 9/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting
import ViewInspector

import BarcLogging
import BarcLoggingDoubles
import BarcPersistenceDoubles
import BarcTestHelpers

@testable import BarcPaywall

@MainActor @Suite(.container)
struct PaywallViewTests {
    @available(iOS 18.0, *)
    @Test("Sends event on appear")
    func onAppearEvent() async throws {
        let logger = SpyLogger()
        Container.shared.logger.register { logger }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }
        let paywall = PaywallView()

        ViewHosting.host(view: paywall)
        defer { ViewHosting.expel() }

        try await paywall.inspection.inspect { inspectedPaywall in
            #expect(logger.loggedEvents.count == 1)
            let event = try #require(logger.loggedEvents.first)
            #expect(event.value == "Barc.PaywallView.viewed")
        }
    }
}
