//  Created by Geoff Pado on 1/19/22.
//  Copyright © 2022 Cocoatype, LLC. All rights reserved.

import BarcErrorHandling
import SwiftUI

struct PaywallTopBarRegular: View {
    @State private var textWidth: CGFloat?

    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            PaywallTopBarHeadline()
                .modifier(SetWidthViewModifier(textWidth: $textWidth))
            PaywallTopBarSubheadline(errorHandler: errorHandler)
                .modifier(GetWidthViewModifier(textWidth: $textWidth))
        }
        .padding(40)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.barcodeViewHeader)
    }

    private struct SetWidthViewModifier: ViewModifier {
        @Binding var textWidth: CGFloat?
        init(textWidth: Binding<CGFloat?>) {
            _textWidth = textWidth
        }

        func body(content: Content) -> some View {
            content
                .background(GeometryReader { proxy in
                    Color.clear.preference(key: TextWidthPreferenceKey.self, value: proxy.size.width)
                })
                .frame(width: textWidth, alignment: .leading)
                .onPreferenceChange(TextWidthPreferenceKey.self) { [$textWidth] in
                    $textWidth.wrappedValue = $0
                }
        }
    }

    private struct GetWidthViewModifier: ViewModifier {
        @Binding var textWidth: CGFloat?
        init(textWidth: Binding<CGFloat?>) {
            _textWidth = textWidth
        }

        func body(content: Content) -> some View {
            content
                .frame(width: textWidth, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .onPreferenceChange(TextWidthPreferenceKey.self) { [$textWidth] in
                    $textWidth.wrappedValue = $0
                }
        }
    }

    private struct TextWidthPreferenceKey: PreferenceKey {
        static let defaultValue: CGFloat = .zero

        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = min(value, nextValue())
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PaywallTopBarRegular(errorHandler: PreviewErrorHandler())
}
