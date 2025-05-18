//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Testing

@testable import BarcWalletExport

struct PassRequestDateTests {
    @Test func encoding() throws {
        let date = PassRequestDate(date: Date(timeIntervalSince1970: 1726556400))
        let encodedData = try JSONEncoder().encode(date)
        let decodedString = try JSONDecoder().decode(String.self, from: encodedData)
        #expect(decodedString == "2024-09-17T07:00:00Z")
    }
}
