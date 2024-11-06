//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit
import SwiftUI

struct PassReviewViewModifier: ViewModifier {
    @Binding private var pass: PKPass?
    init(pass: Binding<PKPass?>) {
        _pass = pass
    }

    func body(content: Content) -> some View {
        content
            .sheet(item: $pass) { pass in
                PassReviewView(pass: pass)
            }
    }
}

extension PKPass: Swift.Identifiable {}

extension View {
    func passReviewSheet(pass: Binding<PKPass?>) -> some View {
        modifier(PassReviewViewModifier(pass: pass))
    }
}
