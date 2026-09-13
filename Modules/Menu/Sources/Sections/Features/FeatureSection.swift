//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct FeatureSection: View {
    var body: some View {
        Section {
            IconsRouteCell()
        }
    }
}

#Preview {
    List {
        FeatureSection()
    }
}
