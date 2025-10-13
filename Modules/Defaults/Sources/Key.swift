//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public struct Key<ValueType>: Sendable {
    let value: String
    init(value: String) {
        self.value = value
    }
}

public enum Keys {
    public static let hasSeenOnboarding = Key<Bool>(value: "RootView.hasSeenOnboarding")
    public static let lastSeenVersion = Key<String>(value: "Keys.lastSeenVersion")
    public static let manualEntryFormat = Key<String>(value: "Keys.manualEntryFormat")
}
