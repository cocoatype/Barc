//  Created by Geoff Pado on 9/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes
import BarcPersistence

public final class StubBarcodeRepository: BarcodeRepository {
    public var codes: [Code] = [
        Code(name: "Cocoatype", value: .qr(value: "https://cocoatype.com", correctionLevel: .m), location: nil, date: nil),
        try! Code(name: "Fours", value: .ean(value: "4444444444444"), location: nil, date: nil),
        Code(name: "Discord", value: .qr(value: "https://iosdev.club", correctionLevel: .m), location: nil, date: nil),
        Code(name: "Black Highlighter", value: .qr(value: "https://blackhighlighter.app/appstore", correctionLevel: .m), location: nil, date: nil),
    ]

    public func add(_ code: Code) {}
    public func update(_ code: Code) {}
    public func delete(_ code: Code) {}

    private var continuations = [AsyncStream<[Code]>.Continuation]()
    public func subscribeToUpdates() -> AsyncStream<[Code]> {
        let (stream, continuation) = AsyncStream<[Code]>.makeStream()
        continuations.append(continuation)
        return stream
    }

    public init() {}

    public func sendUpdates() {
        for continuation in continuations {
            continuation.yield(codes)
        }
    }
}
