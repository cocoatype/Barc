//  Created by Geoff Pado on 5/18/21.
//  Copyright © 2021 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI

public struct PurchaseMarketingView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    public init() {}

    public var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Color.barcodeViewHeader
                Color.systemGroupedBackground
            }.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .topTrailing) {
                        topBar(forWidth: proxy.size.width)
                        PurchaseMarketingCloseButton()
                    }
                    LazyVGrid(columns: columns(forWidth: proxy.size.width), spacing: 20) {
                        PurchaseMarketingItem(
                            header: Strings.multipleItemsHeader,
                            text: Strings.multipleItemsText,
                            image: PaywallAsset.multipleItems.swiftUIImage)
                        PurchaseMarketingItem(
                            header: Strings.supportDevelopmentHeader,
                            text: Strings.supportDevelopmentText,
                            image: PaywallAsset.support.swiftUIImage)
                    }.padding(EdgeInsets(top: 24, leading: 20, bottom: 24, trailing: 20))
                        .background(Color.systemGroupedBackground.ignoresSafeArea())
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
        }
    }

    private static let breakWidth = Double(640)

    @ViewBuilder
    private func topBar(forWidth width: Double) -> some View {
        if width < Self.breakWidth {
            PurchaseMarketingTopBarCompact()
        } else {
            PurchaseMarketingTopBarRegular()
        }
    }

    private func columns(forWidth width: Double) -> [GridItem] {
        if width < Self.breakWidth {
            return [GridItem(spacing: 20)]
        } else {
            return [GridItem(spacing: 20), GridItem(spacing: 20)]
        }
    }

    private typealias Strings = PaywallStrings.PurchaseMarketingView
}

#Preview {
    PurchaseMarketingView()
}
