//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallFooterPrivacyLink: View {
    private let usesShortTitle: Bool
    init(usesShortTitle: Bool) {
        self.usesShortTitle = usesShortTitle
    }

    @Environment(\.openURL) private var openURL
    private func openPrivacy() {
        guard let privacyURL = URL(string: "https://getbarc.app/privacy/") else { return }
        openURL(privacyURL)
    }

    var body: some View {
        if usesShortTitle {
            PaywallFooterLink(title: PaywallStrings.PaywallFooterPrivacyLink.shortTitle, action: openPrivacy)
        } else {
            PaywallFooterLink(title: PaywallStrings.PaywallFooterPrivacyLink.title, action: openPrivacy)
        }
    }
}
