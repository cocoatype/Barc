//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallFooterLinkSection: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            // Restore Purchases — Terms & Conditions — Privacy Policy
            HStack {
                PaywallFooterRestoreLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: false)
            }

            // Restore — Terms & Conditions — Privacy Policy
            HStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: false)
            }

            // Restore — Terms & Conditions — Privacy
            HStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: true)
            }

            // Restore — Terms — Privacy
            HStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: true)
            }

            // Restore Purchases — Terms & Conditions — Privacy Policy
            VStack {
                PaywallFooterRestoreLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: false)
            }
            .frame(maxWidth: .infinity)

            // Restore — Terms & Conditions — Privacy Policy
            VStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: false)
            }
            .frame(maxWidth: .infinity)

            // Restore — Terms & Conditions — Privacy
            VStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: true)
            }
            .frame(maxWidth: .infinity)

            // Restore — Terms — Privacy
            VStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: true)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PaywallFooterLinkSection()
}
