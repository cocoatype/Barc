//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct EditButton: View {
    @Binding private var isEditing: Bool
    init(isEditing: Binding<Bool>) {
        _isEditing = isEditing
    }

    var body: some View {
        Button(Strings.EditButton.title, systemImage: "pencil") {
            withAnimation {
                isEditing = true
            }
        }
    }
}
