//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public struct PreviewDefaultsProvider: DefaultsProvider {
    public init() {}

    public func value(for key: Key<Bool>) -> Bool { false }
    public func set(_ value: Bool, for key: Key<Bool>) {}
    public func value(for key: Key<String>) -> String? { nil }
    public func set(_ value: String?, for key: Key<String>) {}
}
