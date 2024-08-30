//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LibraryEmptyView: View {
    var body: some View {
        VStack {
            TitleText(Strings.title)
            MessageText(Strings.message)
        }
    }

    private typealias Strings = WatchContentsStrings.LibraryEmptyView
}

#Preview {
    LibraryEmptyView()
}
