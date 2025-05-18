//  Created by Geoff Pado on 5/17/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import TestHelpersInterface
import Testing

extension Confirmation: TestHelpersInterface.Expectation {
    public func fulfill() { confirm() }
}
