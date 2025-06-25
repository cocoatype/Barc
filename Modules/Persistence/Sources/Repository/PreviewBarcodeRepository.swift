//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

public struct PreviewBarcodeRepository: BarcodeRepository {
    public static let sampleCodes = [
        Code(name: "Cocoatype", value: .qr(value: "https://cocoatype.com", correctionLevel: .m)),
        try! Code(name: "Fours", value: .ean(value: "4444444444444")),
        Code(name: "Discord", value: .qr(value: "https://iosdev.club", correctionLevel: .m)),
        Code(name: "Black Highlighter", value: .qr(value: "https://blackhighlighter.app/appstore", correctionLevel: .m)),
    ]

    public var codes: [Code] {
        get throws {
            switch result {
            case .success(let success):
                return success
            case .failure(let failure):
                throw failure
            }
        }
    }
    public func add(_ code: Code) {}
    public func update(_ code: Code) {}
    public func delete(_ code: Code) {}

    public func subscribeToUpdates() -> AsyncStream<[Code]> {
        return AsyncStream<[Code]>(unfolding: { nil })
    }

    private let result: Result<[Code], Error>
    init(result: Result<[Code], Error> = .success(Self.sampleCodes)) {
        self.result = result
    }
}
