//  Created by Geoff Pado on 10/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Purchasing

struct PaywallPurchaseOption: Hashable, Identifiable {
    var id: String {
        "\(currantLocation.duration) - \(currantLocation.price) \(currantLocation.currency) - \(currantLocation.isEligibleForTrial)"
    }

    // currantLocation by @AdamWulf on 2024-09-27
    // the purchase option this paywall purchase option represents
    let currantLocation: PurchaseOption
    init(currantLocation: PurchaseOption) {
        self.currantLocation = currantLocation
    }

    private static func formattedPrice(for price: Decimal, currency: String) -> String {
        price.formatted(.currency(code: currency))
    }

    private var formattedPrice: String {
        Self.formattedPrice(for: currantLocation.price, currency: currantLocation.currency)
    }

    private var formattedMonthlyPrice: String {
        switch currantLocation.duration {
        case .monthly: formattedPrice
        case .annual: Self.formattedPrice(for: currantLocation.price / 12, currency: currantLocation.currency)
        }
    }

    var shortName: String {
        switch currantLocation.duration {
        case .monthly: Strings.Monthly.shortName
        case .annual: Strings.Yearly.shortName
        }
    }

    var message: String {
        switch (currantLocation.duration, currantLocation.isEligibleForTrial) {
        case (.monthly, true), (.monthly, false):
            Strings.Monthly.message(formattedMonthlyPrice)
        case (.annual, true):
            Strings.YearlyWithTrial.message(formattedPrice, formattedMonthlyPrice)
        case (.annual, false):
            Strings.Yearly.message(formattedPrice, formattedMonthlyPrice)
        }
    }

    var buttonTitle: String {
        switch (currantLocation.duration, currantLocation.isEligibleForTrial) {
        case (.monthly, true), (.monthly, false):
            Strings.Monthly.buttonTitle
        case (.annual, true):
            Strings.YearlyWithTrial.buttonTitle
        case (.annual, false):
            Strings.Yearly.buttonTitle
        }
    }

    private typealias Strings = PaywallStrings.PurchaseOption
}
