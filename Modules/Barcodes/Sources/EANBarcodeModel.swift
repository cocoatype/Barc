//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

public struct EANBarcodeModel: Codable, Sendable {
    public let value: String

    public init(value: String) {
        self.value = value
    }
}
