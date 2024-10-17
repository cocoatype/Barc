//  Created by Geoff Pado on 5/30/21.
//  Copyright © 2021 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallText: View {
    private let text: String
    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .lineSpacing(3)
            .font(.footnote)
            .foregroundColor(Color(.black))
    }
}

enum PurchaseMarketingTextPreviews: PreviewProvider {
    static var previews: some View {
        PaywallText("PaywallView.supportDevelopmentText")
            .preferredColorScheme(.dark)
    }
}
