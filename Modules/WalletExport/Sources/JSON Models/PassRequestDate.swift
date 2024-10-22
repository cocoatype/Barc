//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

struct PassRequestDate: Encodable {
    private let date: Date
    init(date: Date) {
        self.date = date
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        let formattedDate = date.formatted(.iso8601)
        try container.encode(formattedDate)
    }
}
