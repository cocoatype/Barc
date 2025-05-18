//  Created by Geoff Pado on 5/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import BarcPurchasing

@testable import BarcPaywall

struct PaywallPurchaseOptionEventBuilderTests {
    @Test func monthlyStart() {
        let option = option(duration: .monthly, isEligibleForTrial: false)
        let eventBuilder = PaywallPurchaseOptionEventBuilder()
        let event = eventBuilder.startEvent(for: option)

        #expect(event.value == "Barc.Paywall.purchaseStarted")
        #expect(event.info["duration"] == "monthly")
        #expect(event.info["trialEligible"] == "false")
    }

    @Test func annualTrialStart() {
        let option = option(duration: .annual, isEligibleForTrial: true)
        let eventBuilder = PaywallPurchaseOptionEventBuilder()
        let event = eventBuilder.startEvent(for: option)

        #expect(event.value == "Barc.Paywall.purchaseStarted")
        #expect(event.info["duration"] == "annual")
        #expect(event.info["trialEligible"] == "true")
    }

    @Test func annualNonTrialStart() {
        let option = option(duration: .annual, isEligibleForTrial: false)
        let eventBuilder = PaywallPurchaseOptionEventBuilder()
        let event = eventBuilder.startEvent(for: option)

        #expect(event.value == "Barc.Paywall.purchaseStarted")
        #expect(event.info["duration"] == "annual")
        #expect(event.info["trialEligible"] == "false")
    }

    private func option(
        duration: PurchaseOption.Duration,
        isEligibleForTrial: Bool
    ) -> PaywallPurchaseOption {
        PaywallPurchaseOption(
            currantLocation: PurchaseOption(
                duration: duration,
                price: 0.99,
                currency: "USD",
                isEligibleForTrial: isEligibleForTrial,
                productIdentifier: ""
            )
        )
    }
}
