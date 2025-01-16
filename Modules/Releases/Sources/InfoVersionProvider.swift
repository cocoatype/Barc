//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

struct InfoVersionProvider: VersionProvider {
    let version: String?
    init(
        infoDictionary: [String: Any]? = Bundle.main.infoDictionary
    ) {
        if let infoDictionary,
           let version = infoDictionary["CFBundleShortVersionString"] as? String {
            self.version = version
        } else {
            self.version = nil
        }
    }
}
