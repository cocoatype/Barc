//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallFooterLinkSection: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            HStack {
                PaywallFooterRestoreLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: false)
            }

            HStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: false)
            }

            HStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: true)
            }

            HStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: true)
            }

            VStack {
                PaywallFooterRestoreLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: false)
            }
            .frame(maxWidth: .infinity)

            VStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: false)
            }
            .frame(maxWidth: .infinity)

            VStack {
                PaywallFooterRestoreLink(usesShortTitle: true)
                PaywallFooterLinkSeparator()
                PaywallFooterTermsLink(usesShortTitle: false)
                PaywallFooterLinkSeparator()
                PaywallFooterPrivacyLink(usesShortTitle: true)
            }
            .frame(maxWidth: .infinity)

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
