//  Created by Geoff Pado on 11/7/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents

public struct BarcodeFormatQuery: EntityQuery {
    public init() {}

    public func entities(for identifiers: [BarcodeFormatEntity.ID]) throws -> [BarcodeFormatEntity] {
        return BarcodeFormatEntity.allCases.filter {
            identifiers.contains($0.id)
        }
    }

    public func suggestedEntities() async throws -> [BarcodeFormatEntity] { BarcodeFormatEntity.allCases }
}
