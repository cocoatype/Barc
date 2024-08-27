//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

enum ScanResult {
    case scanning
    case code(Code)
    case error(Error)

    var code: Code? {
        guard case let .code(code) = self else { return nil }
        return code
    }

    var hasError: Bool {
        get { error != nil }
        set(newHasError) {
            if newHasError == false { self = .scanning }
        }
    }

    var error: Error? {
        get {
            guard case let .error(error) = self else { return nil }
            return error
        } set(newError) {
            if let newError {
                self = .error(newError)
            } else {
                self = .scanning
            }
        }
    }
}
