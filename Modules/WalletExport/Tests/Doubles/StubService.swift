//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import PassKit

@testable import WalletExport

struct StubService: Service {
    func fetchPass(for code: Code) async throws -> PKPass {
        return PKPass()
    }
}
