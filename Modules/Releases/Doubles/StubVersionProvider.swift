//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Releases

public struct StubVersionProvider: VersionProvider {
    public let version: String?

    public init(version: String? = nil) {
        self.version = version
    }
}
