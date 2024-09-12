//  Created by Geoff Pado on 9/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import StoreKit
import SwiftUI

public protocol RequestReviewAction {
    func callAsFunction()
}

extension StoreKit.RequestReviewAction: RequestReviewAction {}
