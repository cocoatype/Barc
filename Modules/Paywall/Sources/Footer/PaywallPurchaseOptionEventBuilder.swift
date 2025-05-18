//  Created by Geoff Pado on 5/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import BarcLogging

struct PaywallPurchaseOptionEventBuilder {
    func startEvent(for purchaseOption: PaywallPurchaseOption) -> Event {
        Event(
            name: "Barc.Paywall.purchaseStarted",
            info: [
                "duration": durationInfo(for: purchaseOption),
                "trialEligible": trialInfo(for: purchaseOption)
            ]
        )
    }

    private func durationInfo(for purchaseOption: PaywallPurchaseOption) -> String {
        switch purchaseOption.currantLocation.duration {
        case .annual: "annual"
        case .monthly: "monthly"
        }
    }

    private func trialInfo(for purchaseOption: PaywallPurchaseOption) -> String {
        purchaseOption.currantLocation.isEligibleForTrial.description
    }
}
