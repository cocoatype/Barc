//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationStack {
            MenuList()
        }
    }
}

#Preview {
    Menu()
        .tint(.primary)
}
