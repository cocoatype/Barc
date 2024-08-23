//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct CodeMissingView: View {
    var body: some View {
        VStack {
            WidgetContentsAsset.customBarcodeBadgeQuestionmark.swiftUIImage
                .font(.largeTitle)
                .foregroundStyle(.black)
            Text(WidgetContentsStrings.CodeMissingView.text)
                .font(.subheadline)
                .padding(.horizontal, 14)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    CodeMissingView()
}
