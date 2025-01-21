//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public protocol VersionProvider: Sendable {
    var version: String? { get }
}
