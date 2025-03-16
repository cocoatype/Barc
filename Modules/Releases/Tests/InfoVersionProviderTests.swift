//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcReleases

struct InfoVersionProviderTests {
    @Test("When CFBundleShortVersionString is a string, return it")
    func versionFromInfoDictionary() {
        let provider = InfoVersionProvider(infoDictionary: [
            "CFBundleShortVersionString": "24.0"
        ])

        #expect(provider.version == "24.0")
    }

    @Test("When CFBundleShortVersionString is not a string, return nil")
    func versionWithWrongType() {
        let provider = InfoVersionProvider(infoDictionary: [
            "CFBundleShortVersionString": 24
        ])

        #expect(provider.version == nil)
    }

    @Test("When CFBundleShortVersionString is not present, return nil")
    func versionIsMissing() {
        let provider = InfoVersionProvider(infoDictionary: [:])

        #expect(provider.version == nil)
    }
}
