//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public protocol PurchaseRepository {
    static func initialize()

    var hasUserBeenUnleashed: Bool { get async throws }
}