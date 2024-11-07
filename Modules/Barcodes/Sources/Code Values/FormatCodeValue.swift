//  Created by Geoff Pado on 11/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

protocol FormatCodeValue: Hashable, Identifiable, Sendable {
    var id: String { get }
    var stringRepresentation: String { get throws }
}
