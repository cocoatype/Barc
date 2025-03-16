//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import UniformTypeIdentifiers

extension NSItemProvider {
    @MainActor func loadData(for uniformType: UTType) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            _ = loadDataRepresentation(for: uniformType) { data, error in
                if let data {
                    continuation.resume(returning: data)
                } else if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: PhotoLibraryError.cannotLoadData)
                }
            }
        }
    }
}
