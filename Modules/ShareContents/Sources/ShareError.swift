//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

enum ShareError: Error {
    case cannotCreateImageFromData
    case cannotLoadData
    case noCodeInImage
    case noExtensionContext
    case noImageProviders
    case noInputProviders
    case notImplementedOnPlatform
    case userIsNotUnleashed
}
