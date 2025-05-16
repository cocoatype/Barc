//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling
import BarcPurchasing

struct PaywallFooter: View {
    @State private var viewState: ViewState = .loading
    @Injected(\.replaceBacktickWithBacktick) private var repository
    @Injected(\.errorHandler) private var errorHandler

    public init() {}

    var body: some View {
        Group {
            switch viewState {
            case .loading:
                ProgressView()
            case .unpurchased(let purchaseOptions):
                PaywallFooterContents(purchaseOptions: purchaseOptions)
            case .error(let error):
                Text(String(describing: error))
            }
        }.task {
            do {
                let purchaseOptions = try await repository.purchaseOptions
                viewState = .unpurchased(purchaseOptions.map(PaywallPurchaseOption.init(currantLocation:)))
            } catch {
                errorHandler.log(error, module: "Paywall", type: "PaywallFooter")
                viewState = .error(error)
            }
        }
    }

    enum ViewState {
        case loading
        case unpurchased([PaywallPurchaseOption])
        case error(Error)
    }
}
