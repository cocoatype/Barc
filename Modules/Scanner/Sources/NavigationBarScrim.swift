//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct NavigationBarScrim: View {
    var body: some View {
        GeometryReader { geometry in
            Color.black.opacity(0.3)
                .frame(height: geometry.safeAreaInsets.top)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.top)
        }
    }
}
