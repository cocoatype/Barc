//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import WalletExport

class PassRequestDateTests: XCTestCase {
    func testEncoding() throws {
        let date = PassRequestDate(date: Date(timeIntervalSince1970: 1726556400))
        let encodedData = try JSONEncoder().encode(date)
        let decodedString = try JSONDecoder().decode(String.self, from: encodedData)
        XCTAssertEqual(decodedString, "2024-09-17T07:00:00Z")
    }
}
