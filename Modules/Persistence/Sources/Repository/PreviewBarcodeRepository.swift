//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes

public struct PreviewBarcodeRepository: BarcodeRepository {
    public let codes = [
        Code(name: "Cocoatype", value: .qr(value: "https://cocoatype.com", correctionLevel: .m), triggers: []),
        try! Code(name: "Fours", value: .ean(value: "4444444444444"), triggers: []),
        Code(name: "Discord", value: .qr(value: "https://iosdev.club", correctionLevel: .m), triggers: []),
        Code(name: "Black Highlighter", value: .qr(value: "https://blackhighlighter.app/appstore", correctionLevel: .m), triggers: []),
    ]

    public func add(_ code: Code) {}

    public init() {}
}
