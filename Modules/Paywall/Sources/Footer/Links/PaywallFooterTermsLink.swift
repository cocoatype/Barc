//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallFooterTermsLink: View {
    private let usesShortTitle: Bool
    init(usesShortTitle: Bool) {
        self.usesShortTitle = usesShortTitle
    }

    @Environment(\.openURL) private var openURL
    private func openTerms() {
        guard let termsURL = URL(string: "https://getbarc.app/terms/") else { return }
        openURL(termsURL)
    }

    var body: some View {
        if usesShortTitle {
            PaywallFooterLink(title: PaywallStrings.PaywallFooterTermsLink.shortTitle, action: openTerms)
        } else {
            PaywallFooterLink(title: PaywallStrings.PaywallFooterTermsLink.title, action: openTerms)
        }
    }
}
