//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct MenuView: View {
    public init() {}
    
    public var body: some View {
        NavigationStack {
            MenuList()
                .navigationDestination(for: Route.self) { $0 }
        }
    }
}

#Preview {
    MenuView()
        .tint(.primary)
}
