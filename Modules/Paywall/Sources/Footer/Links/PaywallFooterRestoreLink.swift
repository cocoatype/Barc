//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import StoreKit
import SwiftUI

struct PaywallFooterRestoreLink: View {
    private let usesShortTitle: Bool
    init(usesShortTitle: Bool) {
        self.usesShortTitle = usesShortTitle
    }

    private func restore() {
        Task {
            try await AppStore.sync()
        }
    }

    var body: some View {
        if usesShortTitle {
            PaywallFooterLink(title: PaywallStrings.PaywallFooterRestoreLink.shortTitle, action: restore)
        } else {
            PaywallFooterLink(title: PaywallStrings.PaywallFooterRestoreLink.title, action: restore)
        }
    }
}
