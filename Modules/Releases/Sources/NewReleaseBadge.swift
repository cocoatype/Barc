//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct NewReleaseBadge: View {
    public init() {}

    public var body: some View {
        Circle()
            .foregroundStyle(Color.red)
            .frame(width: 8, height: 8)
    }
}
