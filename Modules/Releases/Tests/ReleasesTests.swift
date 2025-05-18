//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting

@testable import BarcReleases

@Suite(.container)
struct ReleasesTests {
    @Test("versionProvider is an InfoVersionProvider")
    func correctVersionProviderType() throws {
        let versionProvider = Container.shared.versionProvider()
        #expect(versionProvider is InfoVersionProvider)
    }
}
