//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

public struct ExportedPass: Equatable, Identifiable, Sendable {
    public var id: Int { data.hashValue }
    let data: Data
}
