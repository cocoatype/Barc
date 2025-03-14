//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes
import Foundation

@testable import WalletExport

struct StubRequestFactory: URLRequestFactory {
    func request(for code: Code) throws -> URLRequest {
        return URLRequest(url: URL(filePath: "."))
    }
}
