//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import RevenueCatUI
import SwiftUI

public struct PaywallView: View {
    public init() {}

//    typealias RevenueCatPaywall = RevenueCatUI.PaywallView
    public var body: some View {
        Color.red
            .ignoresSafeArea()
            .paywallFooter()
//        RevenueCatPaywall(displayCloseButton: false)
    }
}
