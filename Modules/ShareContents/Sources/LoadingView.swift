//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Color.systemGroupedBackground
            .ignoresSafeArea()
            .overlay {
                VStack(spacing: 8) {
                    ProgressView(ShareContentsStrings.LoadingView.label)
                }
                .frame(maxWidth: 300)
            }
    }
}

#Preview {
    LoadingView()
}
