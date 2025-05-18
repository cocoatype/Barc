//  Created by Geoff Pado on 5/17/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import BarcTestHelpersInterface

extension Confirmation: BarcTestHelpersInterface.Expectation {
    public func fulfill() { confirm() }
}
