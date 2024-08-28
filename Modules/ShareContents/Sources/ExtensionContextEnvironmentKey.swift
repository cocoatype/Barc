//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

public enum ExtensionContextEnvironmentKey: EnvironmentKey {
    public static let defaultValue: NSExtensionContext? = nil
}

public extension EnvironmentValues {
    var extensionContext: NSExtensionContext? {
        get { self[ExtensionContextEnvironmentKey.self] }
        set { self[ExtensionContextEnvironmentKey.self] = newValue }
    }
}
