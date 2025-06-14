//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public protocol PurchaseRepository: Sendable {
    var purchaseOptions: [PurchaseOption] { get async throws }
    @MainActor var hasUserBeenUnleashed: Bool { get async throws }
    @MainActor var cachedHasUserBeenUnleashed: Bool? { get }
    func purchase(_ option: PurchaseOption) async throws
}
