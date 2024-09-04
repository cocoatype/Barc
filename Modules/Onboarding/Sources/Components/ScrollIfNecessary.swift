//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ScrollIfNecessary<Content: View>: View {
    private let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ViewThatFits(in: .vertical) {
            content()
            ScrollView {
                content()
            }
        }
    }
}
