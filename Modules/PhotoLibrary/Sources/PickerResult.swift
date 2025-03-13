//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Barcodes
import PhotosUI
import SwiftUI

enum PickerResult {
    case loading
    case picking
    case scanning(PhotosPickerItem)
    case editing(CodeValue)
    case error(Error)

    var item: PhotosPickerItem? {
        get {
            guard case .scanning(let result) = self else {
                return nil
            }
            return result
        } set(newResult) {
            if let newResult {
                self = .scanning(newResult)
            }
        }
    }

    var codeValue: CodeValue? {
        get {
            guard case .editing(let value) = self else {
                return nil
            }
            return value
        } set(newValue) {
            if let newValue {
                self = .editing(newValue)
            }
        }
    }

    var error: Error? {
        get {
            guard case let .error(error) = self else { return nil }
            return error
        } set(newError) {
            if let newError {
                self = .error(newError)
            }
        }
    }
}
