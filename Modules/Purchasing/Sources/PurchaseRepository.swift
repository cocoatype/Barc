//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public protocol PurchaseRepository {
    var purchaseOptions: [PurchaseOption] { get async throws }
    var hasUserBeenUnleashed: Bool { get async throws }
    func purchase(_ option: PurchaseOption) async throws
}
