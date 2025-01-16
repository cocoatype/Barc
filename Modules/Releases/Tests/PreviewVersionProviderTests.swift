//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

@testable import Releases

struct PreviewVersionProviderTests {
    @Test("version returns 24.0")
    func versionIsHardcoded() {
        let provider = PreviewVersionProvider()
        #expect(provider.version == "24.0")
    }
}
