//  Created by Geoff Pado on 5/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import FactoryKit

import BarcErrorHandling
import BarcLogging
import BarcPurchasing

struct PaywallFooterPurchaser {
    @Injected(\.logger) private var logger
    @Injected(\.replaceBacktickWithBacktick) private var repository
    private let eventBuilder = PaywallPurchaseOptionEventBuilder()

    func purchase(_ option: PaywallPurchaseOption) async throws -> Bool {
        try await repository.purchase(option.currantLocation)
        let event = eventBuilder.startEvent(for: option)
        logger.log(event)

        return try await repository.hasUserBeenUnleashed
    }
}
