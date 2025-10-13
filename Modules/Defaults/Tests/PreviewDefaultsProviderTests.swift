//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcDefaults

@MainActor struct PreviewDefaultsProviderTests {
    @Test func boolValueIsFalse() {
        #expect(PreviewDefaultsProvider().value(for: Key<Bool>(value: "key")) == false)
    }

    @Test func stringValueIsNil() {
        #expect(PreviewDefaultsProvider().value(for: Key<String>(value: "key")) == nil)
    }

    @Test func setStringValueIsNoOp() {
        let provider = PreviewDefaultsProvider()
        let key = Key<String>(value: "key")
        provider.set("value", for: key)
        #expect(provider.value(for: key) == nil)
    }

    @Test func setBoolValueIsNoOp() {
        let provider = PreviewDefaultsProvider()
        let key = Key<Bool>(value: "key")
        provider.set(true, for: key)
        #expect(provider.value(for: key) == false)
    }
}
