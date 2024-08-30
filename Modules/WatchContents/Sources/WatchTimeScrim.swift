//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct WatchTimeScrim: View {
    var body: some View {
        GeometryReader { geometry in
//            Color.black.opacity(0.3)
            Rectangle()
                .fill(LinearGradient(colors: [Color.black.opacity(0.3), Color.white], startPoint: .top, endPoint: .bottom))
                .frame(height: geometry.safeAreaInsets.top)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea([.top, .horizontal])
        }
    }
}
