//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcPurchasing

struct PaywallRouteCell: View {
    @State var hasUserBeenUnleashed: Bool

    private let errorHandler: any ErrorHandler
    private let repository: any PurchaseRepository
    init(
        errorHandler: any ErrorHandler,
        repository: any PurchaseRepository = Purchasing.defaultRepository
    ) {
        self.errorHandler = errorHandler
        self.repository = repository
        _hasUserBeenUnleashed = State(initialValue: repository.cachedHasUserBeenUnleashed)
    }

    var body: some View {
        NavigationLink(value: Route.paywall) {
            VStack(alignment: .leading) {
                Text(Strings.PaywallRouteCell.title)
                    .font(.title3)
                    .fontWeight(.black)
                Text(subtitle)
                    .foregroundStyle(Color.secondary)
            }
        }.task {
            do {
                hasUserBeenUnleashed = try await repository.hasUserBeenUnleashed
            } catch {
                errorHandler.log(error, module: "Menu", type: "PaywallRouteCell")
            }
        }
    }

    private var subtitle: String {
        if hasUserBeenUnleashed {
            Strings.PaywallRouteCell.purchasedSubtitle
        } else {
            Strings.PaywallRouteCell.unpurchasedSubtitle
        }
    }
}

#Preview {
    PaywallRouteCell(errorHandler: PreviewErrorHandler())
}
