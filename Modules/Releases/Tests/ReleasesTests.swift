//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcReleases

struct ReleasesTests {
    @Test("versionProvider is an InfoVersionProvider")
    func correctVersionProviderType() throws {
        #expect(Releases.versionProvider is InfoVersionProvider)
    }
}
