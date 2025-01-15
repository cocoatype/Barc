//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit

protocol PassLibrary {
    func add(_ exportedPass: ExportedPass, isolation: isolated (any Actor)) async throws -> PKPassLibraryAddPassesStatus
}

extension PKPassLibrary: PassLibrary {
    func add(_ exportedPass: ExportedPass, isolation: isolated (any Actor)) async throws -> PKPassLibraryAddPassesStatus {
        let pass = try PKPass(data: exportedPass.data)
        return await withCheckedContinuation { continuation in
            addPasses([pass]) { status in
                continuation.resume(returning: status)
            }
        }
    }
}
