//  Created by Geoff Pado on 1/29/22.
//  Copyright © 2022 Cocoatype, LLC. All rights reserved.

import DesignSystem
import ErrorHandling
import Purchasing
import SwiftUI

struct PaywallTopBarSubheadline: View {
    @State var hasUserBeenUnleashed: Bool

    private let errorHandler: any ErrorHandler
    private let repository: any PurchaseRepository
    init(
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler,
        repository: any PurchaseRepository = Purchasing.defaultRepository
    ) {
        self.errorHandler = errorHandler
        self.repository = repository
        _hasUserBeenUnleashed = State(initialValue: repository.cachedHasUserBeenUnleashed)
    }

    var body: some View {
        Text(content)
            .foregroundColor(.secondary)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .font(.title3)
            .task {
                do {
                    hasUserBeenUnleashed = try await repository.hasUserBeenUnleashed
                } catch {
                    errorHandler.log(error, module: "Menu", type: "PaywallRouteCell")
                }
            }
    }

    private var content: String {
        if hasUserBeenUnleashed {
            PaywallStrings.PurchaseMarketingTopBarSubheadlineLabel.purchasedText
        } else {
            PaywallStrings.PurchaseMarketingTopBarSubheadlineLabel.unpurchasedText
        }
    }
}
