//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Code128ValueToStringConverter {
    public init() {}

    private var elementConverter = Code128ElementToStringConverter()
    public func string(from value: Code128CodeValue) throws -> String {
        var elements = value.payload.elements
        guard elements.count > 0 else {
            throw Code128ConversionError.missingStartSymbol
        }
        let firstElement = elements.removeFirst()

        var currentMode: Code128Mode
        var shiftedFrom: Code128Mode? = nil
        switch firstElement {
        case .e67: currentMode = .a
        case .e68: currentMode = .b
        case .e69: currentMode = .c
        case .e00, .e01, .e02, .e03, .e04, .e05, .e06, .e07, .e08, .e09, .e0a, .e0b, .e0c, .e0d, .e0e, .e0f, .e10, .e11, .e12, .e13, .e14, .e15, .e16, .e17, .e18, .e19, .e1a, .e1b, .e1c, .e1d, .e1e, .e1f, .e20, .e21, .e22, .e23, .e24, .e25, .e26, .e27, .e28, .e29, .e2a, .e2b, .e2c, .e2d, .e2e, .e2f, .e30, .e31, .e32, .e33, .e34, .e35, .e36, .e37, .e38, .e39, .e3a, .e3b, .e3c, .e3d, .e3e, .e3f, .e40, .e41, .e42, .e43, .e44, .e45, .e46, .e47, .e48, .e49, .e4a, .e4b, .e4c, .e4d, .e4e, .e4f, .e50, .e51, .e52, .e53, .e54, .e55, .e56, .e57, .e58, .e59, .e5a, .e5b, .e5c, .e5d, .e5e, .e5f, .e60, .e61, .e62, .e63, .e64, .e65, .e66, .e6a:
            throw Code128ConversionError.missingStartSymbol
        }

        guard elements.count > 0 else {
            throw Code128ConversionError.missingStopSymbol
        }

        guard case .e6a = elements.removeLast() else {
            throw Code128ConversionError.missingStopSymbol
        }

        guard elements.count > 0 else { return "" }
        _ = elements.removeLast() // remove the check digit

        var finalString = ""
        for element in elements {
            do {
                defer {
                    if let returnTo = shiftedFrom {
                        currentMode = returnTo
                        shiftedFrom = nil
                    }
                }

                switch (currentMode, element) {
                case (.a, .e62):
                    currentMode = .b
                    shiftedFrom = .a
                case (.a, .e63):
                    currentMode = .c
                case (.a, .e64):
                    currentMode = .b
                case (.b, .e62):
                    currentMode = .a
                    shiftedFrom = .b
                case (.b, .e63):
                    currentMode = .c
                case (.b, .e65):
                    currentMode = .a
                case (.c, .e64):
                    currentMode = .b
                case (.c, .e65):
                    currentMode = .a
                default:
                    try finalString.append(elementConverter.string(for: element, mode: currentMode))
                }
            } catch Code128ConversionError.noEquivalentCharacter {
                continue
            }
        }

        return finalString
    }
}
