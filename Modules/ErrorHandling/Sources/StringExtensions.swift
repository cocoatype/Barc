//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

extension String {
    init(_ staticString: StaticString) {
        let buffer = staticString.withUTF8Buffer { $0 }
        self.init(decoding: buffer, as: UTF8.self)
    }
}
