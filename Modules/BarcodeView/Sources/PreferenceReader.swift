//  Created by Geoff Pado on 9/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PreferenceReader<Key: PreferenceKey>: View {
    private let key: Key.Type
    private let calculator: (GeometryProxy) -> Key.Value
    init(key: Key.Type = Key.self, calculator: @escaping (GeometryProxy) -> Key.Value) {
        self.key = key
        self.calculator = calculator
    }

    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: key, value: calculator(proxy))
        }
    }
}
