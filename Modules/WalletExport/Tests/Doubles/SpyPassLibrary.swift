//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit
import XCTest

@testable import WalletExport

struct SpyPassLibrary: PassLibrary {
    let addPassesExpectation = XCTestExpectation(description: "addPasses called")
    func add(_ exportedPass: ExportedPass, isolation: isolated (any Actor)) async throws -> PKPassLibraryAddPassesStatus {
        addPassesExpectation.fulfill()
        return .didAddPasses
    }
}
