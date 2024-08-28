//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes

public protocol BarcodeRepository {
    @MainActor var codes: [Code] { get throws }
    @MainActor func add(_ code: Code) throws
    @MainActor func update(_ code: Code) throws
    @MainActor func delete(_ code: Code) throws
    @MainActor func subscribeToUpdates() -> AsyncStream<[Code]>
}
