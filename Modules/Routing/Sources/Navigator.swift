//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Observation
import SwiftUI

@MainActor @Observable public class Navigator {
    public var path = NavigationPath()

    public init() {}

    public func navigate(to route: Route) {
        path = NavigationPath([route])
    }
}
