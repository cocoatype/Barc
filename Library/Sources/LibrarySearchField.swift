//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LibrarySearchField: View {
    var body: some View {
        TextField("LibrarySearchField.title", text: .constant(""), prompt: Text("\(Image(systemName: "magnifyingglass")) ") + Text("LibrarySearchField.prompt"))
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color(uiColor: .secondarySystemBackground))
            }
    }
}

#Preview {
    LibrarySearchField()
}
