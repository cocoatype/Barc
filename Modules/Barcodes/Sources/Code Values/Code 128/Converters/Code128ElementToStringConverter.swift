//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct Code128ElementToStringConverter {
    public init() {}

    private let modeAConverter = Code128ElementToStringConverterModeA()
    private let modeBConverter = Code128ElementToStringConverterModeB()
    private let modeCConverter = Code128ElementToStringConverterModeC()
    public func string(for element: Code128Element, mode: Code128Mode) throws -> String {
        switch mode {
        case .a: try modeAConverter.string(for: element)
        case .b: try modeBConverter.string(for: element)
        case .c: try modeCConverter.string(for: element)
        }
    }
}
