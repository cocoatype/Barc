//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import BarcBarcodes

protocol URLRequestFactory: Sendable {
    func request(for code: Code) throws -> URLRequest
}
