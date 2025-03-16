//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

@MainActor
public protocol BarcodeRepository {
    var codes: [Code] { get throws }
    func add(_ code: Code) throws
    func update(_ code: Code) throws
    func delete(_ code: Code) throws
    func subscribeToUpdates() -> AsyncStream<[Code]>
}
