//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public protocol DefaultsProvider: Actor {
    func value(for key: Key<Bool>) -> Bool
    func set(_ value: Bool, for key: Key<Bool>)

    func value(for key: Key<String>) -> String?
    func set(_ value: String?, for key: Key<String>)
}
