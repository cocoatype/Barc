//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

protocol LocationSearcher: Sendable {
    func locations(for string: String) -> [Location]
}
