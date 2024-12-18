//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Purchasing
import SwiftUI

struct PaywallRouteCell: View {
    @State var hasUserBeenUnleashed: Bool

    private let repository: any PurchaseRepository
    init(repository: any PurchaseRepository = Purchasing.defaultRepository) {
        self.repository = repository
        _hasUserBeenUnleashed = State(initialValue: repository.cachedHasUserBeenUnleashed)
    }

    var body: some View {
        NavigationLink(value: Route.paywall) {
            VStack(alignment: .leading) {
                Text(MenuStrings.PaywallRouteCell.title)
                    .font(.title3)
                    .fontWeight(.black)
                Text(subtitle)
                    .foregroundStyle(Color.secondary)
            }
        }.task {
            print("Fetching hasUserBeenUnleashed…")
            do {
                hasUserBeenUnleashed = try await repository.hasUserBeenUnleashed
            } catch {}
        }
    }

    private var subtitle: String {
        if hasUserBeenUnleashed {
            MenuStrings.PaywallRouteCell.purchasedSubtitle
        } else {
            MenuStrings.PaywallRouteCell.unpurchasedSubtitle
        }
    }
}

#Preview {
    PaywallRouteCell()
}
