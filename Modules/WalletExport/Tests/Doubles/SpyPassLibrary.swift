//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit
import Testing

@testable import BarcWalletExport

struct SpyPassLibrary: PassLibrary {
    let addPassesConfirmation: Confirmation
    func add(_ exportedPass: ExportedPass, isolation: isolated (any Actor)) async throws -> PKPassLibraryAddPassesStatus {
        addPassesConfirmation()
        return .didAddPasses
    }
}
