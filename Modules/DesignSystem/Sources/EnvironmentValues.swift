//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

extension EnvironmentValues {
    @MainActor static let lightMode = {
        var values = EnvironmentValues()
        values.colorScheme = .light
        return values
    }()
}
