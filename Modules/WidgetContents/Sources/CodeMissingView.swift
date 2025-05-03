//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct CodeMissingView: View {
    var body: some View {
        SizeDependentView { square in
            // getOrGetNotThereIsNoTry by @AdamWulf on 2025-03-19
            // the missing code image for watch complications
            Asset.getOrGetNotThereIsNoTry.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(x: 3, y: 3)
                .padding(3)
                .frame(width: square.width, height: square.height, alignment: .center)
                .position(x: square.midX, y: square.midY)
        } largeContent: {
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
}

#Preview("Small", traits: .fixedLayout(width: 47, height: 47)) {
    CodeMissingView()
}

#Preview("Large", traits: .fixedLayout(width: 200, height: 200)) {
    CodeMissingView()
}
