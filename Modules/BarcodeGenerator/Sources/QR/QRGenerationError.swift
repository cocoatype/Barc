//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

enum QRGenerationError: Error {
    case cannotReturnOutput
    case cannotCreateCGImage
}
