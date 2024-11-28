//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum ImageReaderError: Error, CustomLocalizedStringResourceConvertible {
    case incorrectRequestType

    typealias StringResources = ImageReaderStringResources.ImageReaderError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .incorrectRequestType: StringResources.incorrectRequestType
        }
    }
}
