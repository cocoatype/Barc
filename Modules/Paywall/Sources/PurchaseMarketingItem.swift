//  Created by Geoff Pado on 5/30/21.
//  Copyright © 2021 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PurchaseMarketingItem: View {
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
                PurchaseMarketingHeader(header)
                PurchaseMarketingText(text)
            }.padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20))
            image.resizable().aspectRatio(290.0/166.0, contentMode: .fit)
        }
        .background {
            Color.cellBackground
                .cornerRadius(14)
                .shadow(color: .cellShadow, radius: 16, y: 2)
        }
    }
}

enum PurchaseMarketingItemPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            PurchaseMarketingItem(header: "PurchaseMarketingView.supportDevelopmentHeader", text: "PurchaseMarketingView.supportDevelopmentText", image: PaywallAsset.support.swiftUIImage)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.systemGroupedBackground)
        .previewLayout(.fixed(width: 290, height: 242))
    }
}
