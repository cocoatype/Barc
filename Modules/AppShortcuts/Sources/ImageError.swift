//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum ImageError: Error, CustomLocalizedStringResourceConvertible {
    case cannotCreateImageFromData

    typealias StringResources = AppShortcutsStringResources.ImageError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .cannotCreateImageFromData: StringResources.cannotCreateImageFromData
        }
    }
}
