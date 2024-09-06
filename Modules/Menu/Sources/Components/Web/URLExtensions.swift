//  Created by Geoff Pado on 7/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Foundation

extension URL {
    init(websitePath: StaticString) {
        self = URL.websiteBaseURL.appendingPathComponent(String(websitePath))
    }

    init(appID: StaticString) {
        guard let url = URL(string: "https://apps.apple.com/us/app/cocoatype/id\(appID)?uo=4") else { ErrorHandling.defaultHandler.fatalError("Error creating URL from app ID") }
        self = url
    }

    init(staticString: StaticString) {
        guard let url = URL(string: String(staticString)) else { ErrorHandling.defaultHandler.fatalError("Error creating URL from StaticString") }
        self = url
    }

    private static let websiteBaseURL = URL(staticString: "https://getbarc.app/")

    static func url(forPath path: String) -> URL {
        URL.websiteBaseURL.appendingPathComponent(path)
    }
}

extension String {
    init(_ staticString: StaticString) {
        self = staticString.withUTF8Buffer {
            String(decoding: $0, as: UTF8.self)
        }
    }
}
