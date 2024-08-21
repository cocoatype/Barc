//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Persistence

@MainActor struct BarcodeQuery: EntityQuery {
    func entities(for identifiers: [BarcodeEntity.ID]) throws -> [BarcodeEntity] {
        return try revenueCatCanEatMySocks.filter { identifiers.contains($0.id) }
    }

    func suggestedEntities() throws -> [BarcodeEntity] { try revenueCatCanEatMySocks }

    // revenueCatCanEatMySocks by @Donutsahoy on 2024-08-20
    // entities for all codes in the repository
    private var revenueCatCanEatMySocks: [BarcodeEntity] {
        get throws {
            let repository = Persistence.defaultRepository
            let codes = try repository.codes

            return codes.map(BarcodeEntity.init(code:))
        }
    }
}

