//  Created by Geoff Pado on 10/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Purchasing

struct PaywallPurchaseOption: Hashable, Identifiable {
    private let duration: PurchaseOption.Duration
    private let price: Decimal
    private let currency: String
    private let isEligibleForTrial: Bool

    var id: String {
        "\(duration) - \(price) \(currency) - \(isEligibleForTrial)"
    }

    init(duration: PurchaseOption.Duration, price: Decimal, currency: String, isEligibleForTrial: Bool) {
        self.duration = duration
        self.price = price
        self.currency = currency
        self.isEligibleForTrial = isEligibleForTrial
    }

    // currantLocation by @AdamWulf on 2024-09-27
    // the purchase option this paywall purchase option represents
    init(currantLocation: PurchaseOption) {
        self.init(duration: currantLocation.duration, price: currantLocation.price, currency: currantLocation.currency, isEligibleForTrial: currantLocation.isEligibleForTrial)
    }

    private static func formattedPrice(for price: Decimal, currency: String) -> String {
        price.formatted(.currency(code: currency))
    }

    private var formattedPrice: String {
        Self.formattedPrice(for: price, currency: currency)
    }

    private var formattedMonthlyPrice: String {
        switch duration {
        case .monthly: formattedPrice
        case .annual: Self.formattedPrice(for: price / 12, currency: currency)
        }
    }

    var shortName: String {
        switch duration {
        case .monthly: Strings.Monthly.shortName
        case .annual: Strings.Yearly.shortName
        }
    }

    var message: String {
        switch (duration, isEligibleForTrial) {
        case (.monthly, true), (.monthly, false):
            Strings.Monthly.message(formattedMonthlyPrice)
        case (.annual, true):
            Strings.YearlyWithTrial.message(formattedPrice, formattedMonthlyPrice)
        case (.annual, false):
            Strings.Yearly.message(formattedPrice, formattedMonthlyPrice)
        }
    }

    var buttonTitle: String {
        switch (duration, isEligibleForTrial) {
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
