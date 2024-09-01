//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

enum ScanResult {
    case scanning
    case codeValue(CodeValue)
    case error(Error)

    var code: CodeValue? {
        guard case let .codeValue(codeValue) = self else { return nil }
        return codeValue
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
