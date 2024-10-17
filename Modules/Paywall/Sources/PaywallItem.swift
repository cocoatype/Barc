//  Created by Geoff Pado on 5/30/21.
//  Copyright © 2021 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallItem: View {
    private let header: String
    private let text: String
    private let image: Image
    init(header: String, text: String, image: Image) {
        self.header = header
        self.text = text
        self.image = image
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                PaywallHeader(header)
                PaywallText(text)
            }.padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20))

            image
                .resizable()
                .aspectRatio(290.0/166.0, contentMode: .fit)
                .accessibilityHidden(true)
        }
        .background {
            Color.cellBackground
                .cornerRadius(14)
                .shadow(color: .cellShadow, radius: 16, y: 2)
        }
        .accessibilityElement(children: .combine)
    }
}

enum PurchaseMarketingItemPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            PaywallItem(header: "PaywallView.supportDevelopmentHeader", text: "PaywallView.supportDevelopmentText", image: PaywallAsset.support.swiftUIImage)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.systemGroupedBackground)
        .previewLayout(.fixed(width: 290, height: 242))
    }
}
