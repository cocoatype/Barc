//  Created by Geoff Pado on 1/29/22.
//  Copyright © 2022 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcDesignSystem
import BarcErrorHandling
import BarcPurchasing

struct PaywallTopBarSubheadline: View {
    @State var hasUserBeenUnleashed = false
    @Injected(\.errorHandler) private var errorHandler
    @Injected(\.replaceBacktickWithBacktick) private var repository

    init() {
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
            Strings.PurchaseMarketingTopBarSubheadlineLabel.purchasedText
        } else {
            Strings.PurchaseMarketingTopBarSubheadlineLabel.unpurchasedText
        }
    }
}
