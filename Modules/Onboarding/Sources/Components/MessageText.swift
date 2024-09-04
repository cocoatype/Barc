//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct MessageText: View {
    private let representation: StringRepresentation
    init(_ representation: StringRepresentation) {
        self.representation = representation
    }

    init(_ key: LocalizedStringKey) {
        self.init(.key(key))
    }

    init(_ string: String) {
        self.init(.string(string))
    }

    var body: some View {
        representation.text
            .font(.title3)
    }
}

#Preview {
    MessageText("""
Thanks for downloading Barc!

To help you get started using Barc to store your important barcodes, I’ve put together a short tour. If you’ve used Barc before, or would rather just get started, feel free to skip it and jump right into saving.

Either way, I hope you have a great time using Barc! If you have any questions or concerns, you can contact me from the settings menu at any time.

—Geoff, Barc Developer
""")
}
