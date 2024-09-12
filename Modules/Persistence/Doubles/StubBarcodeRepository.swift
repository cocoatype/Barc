//  Created by Geoff Pado on 9/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Persistence

public struct StubBarcodeRepository: BarcodeRepository {
    public var codes: [Code] = [
        Code(name: "Cocoatype", value: .qr(value: "https://cocoatype.com", correctionLevel: .m), location: nil, date: nil),
        try! Code(name: "Fours", value: .ean(value: "4444444444444"), location: nil, date: nil),
        Code(name: "Discord", value: .qr(value: "https://iosdev.club", correctionLevel: .m), location: nil, date: nil),
        Code(name: "Black Highlighter", value: .qr(value: "https://blackhighlighter.app/appstore", correctionLevel: .m), location: nil, date: nil),
    ]

    public func add(_ code: Code) {}
    public func update(_ code: Code) {}
    public func delete(_ code: Code) {}

    public func subscribeToUpdates() -> AsyncStream<[Code]> {
        return AsyncStream<[Code]>(unfolding: { nil })
    }

    public init() {}
}
