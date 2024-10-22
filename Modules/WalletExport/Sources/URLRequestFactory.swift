//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation

protocol URLRequestFactory {
    func request(for code: Code) throws -> URLRequest
}
