//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

public struct QRBarcodeModel: Codable, Sendable {
    public let value: String
    public let correctionLevel: String

    public init(value: String, correctionLevel: String) {
        self.value = value
        self.correctionLevel = correctionLevel
    }
}
