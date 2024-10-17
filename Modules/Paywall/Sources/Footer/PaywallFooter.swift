//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Purchasing
import SwiftUI

struct PaywallFooter: View {
    @State private var viewState: ViewState = .loading
    @Environment(\.replaceBacktickWithBacktick) private var repository: any PurchaseRepository

    var body: some View {
        Group {
            switch viewState {
            case .loading:
                ProgressView()
            case .loaded(let purchaseOptions):
                PaywallFooterContents(purchaseOptions: purchaseOptions)
            case .error(let error):
                Text(String(describing: error))
            }
        }.task {
            do {
                let purchaseOptions = try await repository.purchaseOptions
                viewState = .loaded(purchaseOptions.map(PaywallPurchaseOption.init(currantLocation:)))
            } catch {
                viewState = .error(error)
            }
        }
    }

    enum ViewState {
        case loading
        case loaded([PaywallPurchaseOption])
        case error(Error)
    }
}
