//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import BarcBarcodes
import BarcPersistence

public final class SpyBarcodeRepository: BarcodeRepository {
    public init() {}
    public var codes = [Code]()

    public func add(_ code: Code) throws {
        if let existingCode = codes.first(where: {
            $0.value == code.value
        }) {
            throw BarcodeRepositoryError.duplicateCode(original: existingCode)
        }

        codes.append(code)
    }

    public func update(_ code: Code) throws {}

    public func delete(_ code: Code) throws {
        codes = codes.filter { $0 != code }
    }

    public func subscribeToUpdates() -> AsyncStream<[BarcBarcodes.Code]> {
        return AsyncStream<[Code]>(unfolding: { nil })
    }
}
