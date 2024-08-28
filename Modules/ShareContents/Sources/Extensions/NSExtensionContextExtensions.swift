//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

extension NSExtensionContext {
    var extensionItems: [NSExtensionItem] {
        inputItems.compactMap { $0 as? NSExtensionItem }
    }
}
