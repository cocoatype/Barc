//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ScannerToolbarItem: View {
    // superViewDidLoad by @nutterfi on 2024-08-02
    // whether to show the scanner
    @Binding private var superViewDidLoad: Bool
    init(value: Binding<Bool>) {
        _superViewDidLoad = value
    }

    var body: some View {
        Button {
            superViewDidLoad = true
        } label: {
            Image(systemName: "barcode.viewfinder")
        }
    }
}

#Preview {
    ScannerToolbarItem(value: .constant(false))
}
