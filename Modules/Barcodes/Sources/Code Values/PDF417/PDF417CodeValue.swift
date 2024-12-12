//  Created by Geoff Pado on 12/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PDF417

public struct PDF417CodeValue: FormatCodeValue {
    public let dataCodewords: [Codeword]
    public var id: String { stringRepresentation }

    public var stringRepresentation: String {
        #warning("FIX ME!!!")
        return String(describing: dataCodewords)
    }

    public init(dataCodewords: [Codeword]) {
        self.dataCodewords = dataCodewords
    }
}
