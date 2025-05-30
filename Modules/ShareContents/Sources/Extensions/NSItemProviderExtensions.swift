//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import UniformTypeIdentifiers

extension NSItemProvider {
    func contains(_ uniformType: UTType) -> Bool {
        return registeredContentTypes.contains {
            $0.conforms(to: uniformType)
        }
    }

    @MainActor func loadData(for uniformType: UTType) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            _ = loadDataRepresentation(for: uniformType) { data, error in
                if let data {
                    continuation.resume(returning: data)
                } else if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: ShareError.cannotLoadData)
                }
            }
        }
    }

    @MainActor func loadItem<ItemClass: NSItemProviderReading & Sendable>(for uniformType: UTType) async throws -> ItemClass {
        return try await withCheckedThrowingContinuation { continuation in
            _ = loadObject(ofClass: ItemClass.self) { maybeItem, error in
                if let item = maybeItem as? ItemClass {
                    continuation.resume(returning: item)
                } else if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: ShareError.cannotLoadData)
                }
            }
        }
    }
}
