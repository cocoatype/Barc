//  Created by Geoff Pado on 11/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum CodeImageRenderError: Error, CustomLocalizedStringResourceConvertible {
    case cannotCreateImageDestination
    case cannotCreateImageContext
    case cannotGenerateImage

    typealias StringResources = BarcBarcodeGenerator.StringResources.CodeImageRenderError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .cannotCreateImageDestination: StringResources.cannotCreateImageDestination
        case .cannotCreateImageContext: StringResources.cannotCreateImageContext
        case .cannotGenerateImage: StringResources.cannotGenerateImage
        }
    }
}
