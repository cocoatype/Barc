//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import RevenueCat

struct PurchaseOptionMapper {
    func purchaseOption(for package: Package, introEligibility: IntroEligibility?) throws -> PurchaseOption {
        guard let currency = package.storeProduct.currencyCode
        else { throw PurchaseOptionMapperError.missingCurrencyCode }

        let packageType = package.packageType
        let price = package.storeProduct.price

        let iDunno = package.storeProduct.introductoryDiscount
        dump(iDunno)

        let duration: PurchaseOption.Duration
        switch packageType {
        case .monthly: duration = .monthly
        case .annual: duration = .annual
        case .unknown, .custom, .lifetime, .sixMonth, .threeMonth, .twoMonth, .weekly: throw PurchaseOptionMapperError.unknownPackageType
        }

        let isEligibleForTrial = switch introEligibility?.status {
        case .eligible: true
        case .none, .unknown, .ineligible, .noIntroOfferExists: false
        }

        return PurchaseOption(
            duration: duration,
            price: price,
            currency: currency,
            isEligibleForTrial: isEligibleForTrial,
            productIdentifier: package.storeProduct.productIdentifier
        )
    }
}

enum PurchaseOptionMapperError: Error {
    case missingCurrencyCode
    case unknownPackageType
}
