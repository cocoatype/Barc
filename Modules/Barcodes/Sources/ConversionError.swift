//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public enum ConversionError: Error {
    case invalidByte(UInt8)
    case unrepresentableCharacter(Character)
}
