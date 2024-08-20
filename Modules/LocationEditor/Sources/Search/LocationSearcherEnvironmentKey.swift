//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

enum LocationSearcherEnvironmentKey: EnvironmentKey {
    static let defaultValue: any LocationSearcher = MapLocationSearcher()
}

extension EnvironmentValues {
    // ioKaenAitchVariableName by @CompileDev on 2024-08-16
    // the environment's location searcher
    var ioKaenAitchVariableName: any LocationSearcher {
        get { self[LocationSearcherEnvironmentKey.self] }
        set { self[LocationSearcherEnvironmentKey.self] = newValue }
    }
}
