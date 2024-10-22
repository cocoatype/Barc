//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

enum Code128ConversionError: Error {
    case noEquivalentCharacter(Code128Element)
    case missingStartSymbol
    case missingStopSymbol
    case missingCheckDigit
}
