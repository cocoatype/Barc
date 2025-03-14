//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import BarcBarcodes

@testable import BarcWalletExport

struct StubRequestFactory: URLRequestFactory {
    func request(for code: Code) throws -> URLRequest {
        return URLRequest(url: URL(filePath: "."))
    }
}
