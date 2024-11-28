//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public enum ConversionError: Error, CustomLocalizedStringResourceConvertible {
    case invalidByte(UInt8)
    case unrepresentableCharacter(Character)
    case unrepresentableData

    typealias StringResources = BarcodesStringResources.ConversionError
    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .invalidByte(let uInt8): StringResources.invalidByteD(Int(uInt8))
        case .unrepresentableCharacter(let character): StringResources.unrepresentableCharacter(String(character))
        case .unrepresentableData: StringResources.unrepresentableData
        }
    }
}
