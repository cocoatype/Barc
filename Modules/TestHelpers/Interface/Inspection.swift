//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Combine
import SwiftUI

public final class Inspection<V> {
    public let notice = PassthroughSubject<UInt, Never>()
    public var callbacks = [UInt: (V) -> Void]()

    public init() {}

    public func visit(_ view: V, _ line: UInt) {
        if let callback = callbacks.removeValue(forKey: line) {
            callback(view)
        }
    }
}
