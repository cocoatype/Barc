//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit

import BarcBarcodes

@testable import BarcWalletExport

struct StubService: Service {
    func fetchPass(for code: Code) async throws -> ExportedPass {
        return ExportedPass(data: Data())
    }
}
