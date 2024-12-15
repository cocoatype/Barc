//  Created by Geoff Pado on 12/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PDF417

public struct PDF417CodeValue: FormatCodeValue {
    public let dataCodewords: [Codeword]
    public var id: String {
        dataCodewords
            .map(CodewordToIntConverter().value(for:))
            .map(String.init)
            .joined()
    }

    public var stringRepresentation: String {
        get throws {
            try HumanReadableDecoder().string(for: dataCodewords)
        }
    }

    public init(dataCodewords: [Codeword]) {
        self.dataCodewords = dataCodewords
    }
}
