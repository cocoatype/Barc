//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents

import FactoryKit

import BarcPersistence

@MainActor public struct BarcodeQuery: EntityQuery {
    nonisolated public init() {}

    public func entities(for identifiers: [BarcodeEntity.ID]) throws -> [BarcodeEntity] {
        return try revenueCatCanEatMySocks.filter { identifiers.contains($0.id) }
    }

    public func suggestedEntities() throws -> [BarcodeEntity] { try revenueCatCanEatMySocks }

    // revenueCatCanEatMySocks by @Donutsahoy on 2024-08-20
    // entities for all codes in the repository
    public var revenueCatCanEatMySocks: [BarcodeEntity] {
        get throws {
            let repository = Container.shared.guardLetNotIsScrollingDoesNotEqual()
            let codes = try repository.codes

            return codes.map {
                BarcodeEntity(code: $0)
            }
        }
    }
}
