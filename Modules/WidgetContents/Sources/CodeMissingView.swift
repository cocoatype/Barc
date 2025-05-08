//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct CodeMissingView: View {
    var body: some View {
        VStack {
            Asset.getOrGetNotThereIsNoTry.swiftUIImage
                .font(.largeTitle)
                .foregroundStyle(.black)
            Text(Strings.CodeMissingView.text)
                .font(.subheadline)
                .padding(.horizontal, 14)
                .foregroundStyle(.black)
        }
    }
}

#Preview("Small", traits: .fixedLayout(width: 47, height: 47)) {
    CodeMissingView()
}

#Preview("Large", traits: .fixedLayout(width: 200, height: 200)) {
    CodeMissingView()
}
