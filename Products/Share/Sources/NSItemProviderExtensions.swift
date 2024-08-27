//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import UniformTypeIdentifiers

extension NSItemProvider {
    func loadData(for uniformType: UTType) async throws -> Data {
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
}
